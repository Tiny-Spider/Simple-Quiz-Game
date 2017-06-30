package;

import sys.db.Connection;
import sys.db.ResultSet;
import sys.db.Sqlite;

/**
 * Database management class
 * @author Tavi
 */
class Database
{
	// Connection to database
	private static var database:Connection;

	/**
	 * Get the instance of this class
	 * @return
	 */
	public static function getInstance():Connection
	{
		if (database == null)
		{
			database = Sqlite.open('data/database.db');
		}
		
		return database;
	}

	/**
	 * Get the scene data from the database by id
	 * @param	id
	 * @return
	 */
	public static function getSceneData(id:Int):ResultSet
	{
		return getInstance().request('SELECT * FROM scenes WHERE id=$id');
	}

	/**
	 * Add new score to leaderboard using name and score
	 * @param	name
	 * @param	score
	 * @return
	 */
	public static function addLeaderboard(name:String, score:Int):ResultSet
	{
		return getInstance().request('INSERT INTO leaderboard ("name", "score") VALUES ("$name", $score)');
	}

	/**
	 * Get the top amount of scores from the database
	 * @param	amount
	 * @return
	 */
	public static function getLeaderboard(amount:Int):ResultSet
	{
		return getInstance().request('SELECT * FROM leaderboard ORDER BY score DESC LIMIT $amount');
	}

	/**
	 * Clear all scores from the leaderboard
	 * @return
	 */
	public static function clearLeaderboard():ResultSet
	{
		return getInstance().request("DELETE FROM leaderboard");
	}
}