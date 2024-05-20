<?php

namespace App\Http\Controllers\giant;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Traits\SchemaTrait;
class SchemaController extends Controller
{

    use SchemaTrait;

    public function update(Request $request, $tableName, $id){
        $data=$this->edit_table($request, $tableName, $id);
     
        return response()->json($data);

    }
   
}
