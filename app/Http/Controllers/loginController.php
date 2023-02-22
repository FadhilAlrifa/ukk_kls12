<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class loginController extends Controller
{
    public function login(Request $request){
        $request->validate([
            'username'=>'required',
            'password'=>'required',
        ],[
            'username.required'=>"Username Tidak Boleh Kosong",
            'password.required'=>"Password Tidak Boleh Kosong",


        ]);
        if(Auth::attempt(['username'=>$request->username,
        'password'=>$request->password,'level'=>'admin'])){
            return redirect('admin');
        }
        elseif(Auth::attempt(['username'=>$request->username,
        'password'=>$request->password,'level'=>'masyarakat'])){
            return redirect('masyarakat');
        }
        elseif(Auth::attempt(['username'=>$request->username,
        'password'=>$request->password,'level'=>'petugas'])){
            return redirect('petugas');
        }
        else{
            redirect('/');
        }
    }
    public function logout(){
        Auth::logout();
        return redirect('/');
    }
}
