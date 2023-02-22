<?php
namespace App\Http\Controllers;
use App\Models\register;
use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;

class adminController extends Controller
{
    public function index()
    {
        return Inertia::render('admin/home');
    }
    public function user()
    {
         $data=User::latest()->get();
        return Inertia::render('admin/user', [
            'data'=>$data
        ]);
    }
    public function userPost(Request $request)
    {
        $request->validate([
            'nama'=>'required',
            'username'=>'required',
            'password'=>'required',
            'level'=>'required',
            'tlp'=>'required',
        ]);
        User::updateOrCreate(['id'=>$request->id],[
            'nama'=>$request->nama,
            'username'=>$request->username,
            'password'=>bcrypt($request->password),
            'level'=>$request->level,
            'tlp'=>$request->tlp,
            'nik'=>$request->nik,
        ]);
        return redirect()->back();
    }
    public function userEdit($id){
        $data=User::where('id', $id)->first();
         return response()->json($data);
    }
    public function userHapus($id){
        if($id){
            $hapus=User::find($id);
            $hapus->delete();
        }
        return redirect()->back();
    }
    public function usereg()
    {
        $reg=register::latest()->get();
        return Inertia::render('admin/register',[
            'reg'=>$reg
        ]);
    }
    public function regpros($id){
        $tangkap=register::where('id', $id)->first();
        user::create([
            'nama'=>$tangkap->nama,
            'nik'=>$tangkap->nik,
            'tlp'=>$tangkap->tlp,
            'username'=>$tangkap->username,
            'password'=>bcrypt($tangkap->password),
            'level'=>'masyarakat'
        ]);
        if($tangkap->id){
            $hapus=register::find($tangkap->id);
            $hapus->delete();
        }
        return redirect()->back();
    }
}
