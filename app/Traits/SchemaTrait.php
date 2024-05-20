<?php

namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Eloquent\Model;
use PDO;


trait SchemaTrait
{


public function edit_table(Request $request, $tableName, $id){
        // Check if the table exists
            if (!Schema::hasTable($tableName)) {
                return response()->json(['error' => 'Table not found'], 404);
            }
            // Generate validation rules dynamically
            $rules = $this->generateValidationRules($tableName);
    
            // Validate the input
            $data = $request->validate($rules);
            // Update the record in the specified table
            try {
                DB::table($tableName)
                    ->where('id', $id)
                    ->update($data);
    
                return response()->json(['success' => 'Record updated successfully'], 200);
            } catch (\Exception $e) {
                return response()->json(['error' => 'Update failed: ' . $e->getMessage()], 500);
            }
        }
    
        private function generateValidationRules($tableName){
         
            $columns = Schema::getColumnListing($tableName);
            $rules = [];
        
            foreach ($columns as $column) {
                if (in_array($column, ['id', 'created_at', 'updated_at'])) {
                    continue;
                }
        
                $type = Schema::getColumnType($tableName, $column);
        
                // Use getColumnMeta instead of getDoctrineColumn for SQLite
                $columnDetails = DB::connection()->getPdo()->query("DESCRIBE `" . $tableName . "` `" . $column . "`")->fetch(PDO::FETCH_ASSOC);
        
                $rule = [];
        
                // Add rules based on column type
                switch ($type) {
                    case 'string':
                        $rule[] = 'string';
                        $rule[] = 'max:' . (isset($columnDetails['length']) ? $columnDetails['length'] : 255); // Handle potential missing length for some data types
                        break;
                    case 'integer':
                        $rule[] = 'integer';
                        break;
                    case 'boolean':
                        $rule[] = 'boolean';
                        break;
                    case 'timestamp':
                    case 'datetime':
                        $rule[] = 'date';
                        break;
                }
        
                // Add nullable rule based on Laravel's NOT NULL check (assuming your database uses the same convention)
                if (!array_key_exists('null', $columnDetails) || $columnDetails['null'] === 'NO') {
                    $rule[] = 'required';
                } else {
                    $rule[] = 'nullable';
                }
        
                // Consider adding unique rule logic here if needed (you can check for unique indexes on the column)
        
                $rules[$column] = implode('|', $rule);
            }
        
            return $rules;


        }


}
