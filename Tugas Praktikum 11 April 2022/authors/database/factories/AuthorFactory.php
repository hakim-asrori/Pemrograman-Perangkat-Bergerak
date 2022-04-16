<?php

namespace Database\Factories;

use App\Models\Author;
use Illuminate\Database\Eloquent\Factories\Factory;

class AuthorFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Author::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'github' => preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($this->faker->userName))),
            'twitter' => preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($this->faker->userName))),
            'location' => $this->faker->city,
            'latest_article_published' => date('d F Y'),
            'image' => $this->faker->imageUrl(480, 480),
        ];
    }
}
