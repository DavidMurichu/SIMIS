<?php

namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Eloquent\Model;
use Log;
use PDO;


trait SchemaTrait
{





// public function edit_tablee(Request $request, $tableName, $id){
//         // Check if the table exists
//             if (!Schema::hasTable($tableName)) {
//                 return response()->json(['error' => 'Table not found'], 404);
//             }
//             // Generate validation rules dynamically
//             $rules = $this->generateValidationRules($tableName);
    
//             // Validate the input
//             $data = $request->validate($rules);
//             // return response()->json($data);

//             // Update the record in the specified table
//             // try {
//             //     DB::table($tableName)
//             //         ->where('id', $id)
//             //         ->update($data);
    
//             //     return response()->json(['success' => 'Record updated successfully'], 200);
//             // } catch (\Exception $e) {
//             //     return response()->json(['error' => 'Update failed: ' . $e->getMessage()], 500);
//             // }
//         }

private function get_validation_rules($tableName, $columns)
{
    if (!Schema::hasTable($tableName)) {
        return response()->json(['error' => 'Table not found'], 404);
    }

    $rules = [];
    
    foreach ($columns as $column) {
        if (!Schema::hasColumn($tableName, $column)) {
            // If the column doesn't exist in the table, skip it
           return response()->json(['error'=> 'do not exist'],404);
        }

        if (in_array($column, ['id', 'created_at', 'updated_at', 'active','email','password','otp'])) {
            // Skip these special columns
            continue;
        }

        // Get column type and nullability
        $columnType = Schema::getColumnType($tableName, $column);
        $isNullable = $this->isColumnNullable($tableName, $column);

        // Initialize an array to hold the rules for this column
        $columnRules = [];

        // Add rules based on the type of the column
        switch ($columnType) {
            case 'string':
                $columnRules[] = 'string';
                $maxLength = $this->getColumnMaxLength($tableName, $column);
                $columnRules[] = 'max:' . ($maxLength ?? 255);
                break;
            case 'integer':
                $columnRules[] = 'integer';
                break;
            case 'boolean':
                $columnRules[] = 'boolean';
                break;
            case 'float':
            case 'double':
            case 'decimal':
                $columnRules[] = 'numeric';
                break;
            case 'date':
            case 'datetime': // Combine datetime and timestamp into 'date' validation rule
            case 'timestamp':
                $columnRules[] = 'date';
                break;
            default:
                break;
        }

        // Add nullable or required rule based on column nullability
        if ($isNullable) {
            $columnRules[] = 'nullable';
        } else {
            $columnRules[] = 'required';
        }

        // Common validation rules based on column name patterns
        if (str_contains($column, 'email')) {
            $columnRules[] = 'email';
        }

        if (str_contains($column, 'password')) {
            $columnRules[] = 'confirmed';
        }

        // Additional rules based on column names
        if (str_contains($column, 'url')) {
            $columnRules[] = 'url';
        }

        if (str_contains($column, 'file')) {
            $columnRules[] = 'file';
        }

        // Compile the rules for this column into a string
        $rules[$column] = implode('|', $columnRules);
    }

    return $rules;
 
}

private function getColumnMaxLength($tableName, $column)
{
    $databaseName = DB::connection()->getDatabaseName();
    $query = "SELECT CHARACTER_MAXIMUM_LENGTH 
              FROM information_schema.COLUMNS 
              WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? AND COLUMN_NAME = ?";
    $result = DB::select($query, [$databaseName, $tableName, $column]);

    return $result[0]->CHARACTER_MAXIMUM_LENGTH ?? null;
}

private function isColumnNullable($tableName, $column)
{
    $databaseName = DB::connection()->getDatabaseName();
    $query = "SELECT IS_NULLABLE 
              FROM information_schema.COLUMNS 
              WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? AND COLUMN_NAME = ?";
    $result = DB::select($query, [$databaseName, $tableName, $column]);

    return $result[0]->IS_NULLABLE === 'YES';
}

//get data
     public function getDataByTableName($tableName, $columns=['*'])
        {
         try{



            if (!Schema::hasTable($tableName)) {
                return response()->json(['error' => 'Table does not exist'], 404);
            }
            // $modelInstance = app($model);
            // Get the fillable attributes from the model
            // $columns = $modelInstance->getFillable();
            $query = DB::table($tableName);
            if (!empty($columns)) {
                $query->select($columns);
            }
            $data = $query->get();
            // Return the data
            return $data[0];
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error'=> $e->getMessage()],500);
        }

        }


        //delete Data
        
        public function deleteData($tableName, $id)
{
    try {
        // Check if the table exists
        if (!Schema::hasTable($tableName)) {
            return response()->json(['error' => 'Table does not exist'], 404);
        }

        // Execute the DELETE query
        DB::table($tableName)->where('id', $id)->delete();

        // Return success response
        return response()->json(['message' => 'Data deleted successfully'], 200);
    } catch (\Exception $e) {
        Log::error($e->getMessage());

        // Return error response
        return response()->json(['error' => $e->getMessage()], 500);
    }
}
}