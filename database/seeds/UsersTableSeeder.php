<?php

use Illuminate\Database\Seeder;
use App\User;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        User::create([
        	'name' => 'Marco Tulio',
        	'email' => 'marco.tulio95@hotmail.com',
        	'password' => bcrypt('123456')]);
    }
}
