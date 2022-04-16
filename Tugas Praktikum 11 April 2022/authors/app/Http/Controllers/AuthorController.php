<?php

namespace App\Http\Controllers;

use App\Models\Author;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function showAllAuthors()
    {
        $author = Author::orderBy('name', 'asc')->get();

        $data = [];

        foreach ($author as $a) {
            $data[] = [
                'id' => $a->id,
                'name' => $a->name,
                'email' => $a->email,
                'github' => $a->github,
                'twitter' => $a->twitter,
                'location' => $a->location,
                'image' => $a->image,
                'latest_article_published' => $a->latest_article_published,
                'created_at' => date('d F Y', strtotime($a->updated_at)),
            ];
        }

        return response()->json($data);
    }

    public function showOneAuthors($id)
    {
        return response()->json(Author::find($id));
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:authors',
            'location' => 'required|alpha'
        ]);

        $authors = Author::create($request->all());

        return response()->json($authors, 201);
    }

    public function update($id, Request $request)
    {
        $authors = Author::findOrFail($id);
        $authors->update($request->all());

        return response()->json($authors, 200);
    }

    public function delete($id)
    {
        $authors = Author::findOrFail($id)->delete();

        return response()->json('Deleted Successfully', 200);
    }
}
