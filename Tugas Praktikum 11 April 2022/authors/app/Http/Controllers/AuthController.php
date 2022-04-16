<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Firebase\JWT\JWT;

class AuthController extends Controller
{
    public static string $SECRET_KEY = "hakimasrori1234567890";

    public function register(Request $request)
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required',
        ]);

        $username = $request->input('username');
        $password = Hash::make($request->input('password'));

        $user = User::create([
            'username' => $username,
            'password' => $password,
        ]);

        return response()->json(['message' => 'Data Successfully Added'], 201);
    }

    public function login(Request $request)
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required',
        ]);

        $username = $request->input('username');
        $password = $request->input('password');

        $user = User::where('username', $username)->first();

        if (!$user) {
            return response()->json(['message' => 'Login Failed!'], 401);
        }

        if (!Hash::check($password, $user->password)) {
            return response()->json(['message' => 'Login Failed!'], 401);
        }

        if ($user->username == 'admin') {
            $payload = [
                'username' => $user->username,
                'role' => 'admin'
            ];
        } else {
            $payload = [
                'username' => $user->username,
                'role' => 'guest'
            ];
        }

        $jwt = JWT::encode($payload, AuthController::$SECRET_KEY, 'HS256');

        $user->update([
            'token' => $jwt,
        ]);

        return response()->json($user);
    }
}
