/**
 * A point on the map
 * Don't forget :
 *  --> X
 * |
 * v Y 
 */
class Pos
{
	/* The position of the point following the axe x */
	float x;

	/* The position of the point following the axe y */
	float y;

	/**
	 * Constructor of Pos
	 * @param x: the position of the point following the axis x
	 * @param y: the position of the point following the axis y
	 */
	Pos(float x, float y)
	{
		this.x = x;
		this.y = y;
	}

	/**
	 * Copy constructor
	 */
	Pos(Pos pos)
	{
		this.x = pos.x;
		this.y = pos.y;
	}

	/**
	 * Check if a point is near of another one
	 * @param pos: the position you want to compare
	 * @param distance: the approximation you want to make
	 * @return a boolean that indicates if the point is arround "pos"
	 */
	boolean is_around(Pos pos, int distance)
	{
		return abs(this.x - pos.x) < distance && abs(this.y - pos.y) < distance;
	}

	/**
	 * Check if a point is at the same position of another one
	 * @param pos: the position you want to compare
	 * @return a boolean that indicates if the point is at the same position of "pos"
	 */
	boolean is(Pos pos)
	{
		return this.x == pos.x && this.y == pos.y;
	}

	/**
	 * Calculate the euclidian distance between two points
	 * @param pos: the position of the other point
	 * @return the distance between the point and "pos"
	 */
	float dist(Pos pos)
	{
		return sqrt(pow(this.x - pos.x, 2) + pow(this.y - pos.y, 2));
	}

	/**
	 * Calculate the angle between two points
	 * @param pos: the position of the other point
	 * @return the angle between the point and "pos"
	 */
	float angle(Pos pos)
	{
		return mod2Pi(atan2(pos.y - this.y, pos.x - this.x));
	}

	/**
	 * Check wich pos is closer to yours
	 * @param tab_pos: the list of position to compare
	 * @return the index of the closer position
	 */
	int closer(Pos[] tab_pos)
	{
		int closest = 0;
		float dist = dist(tab_pos[0]);

		for(int i = 1; i < tab_pos.length; i++)
		{
			float dist_pos = dist(tab_pos[i]);
			if(dist_pos < dist)
			{
				dist = dist_pos;
				closest = i;
			}
		}

		return closest;
	}

	/**
	 * Check if the position is in the arena
	 * @return a boolean that indicate if the point in the arena
	 */
	boolean on_arena(int gap)
	{
		int gap_port = 100;
		int port_x = (dir == Dir.left) ? ARENA_HEIGHT - 200 : 200;
		boolean on_port = (dir == Dir.left) ? this.x > port_x - gap : this.x < port_x - gap;

		return ((this.x > gap) && (this.x < ARENA_HEIGHT - gap) && (this.y > gap) && (this.y < ARENA_WIDTH - gap)
		& !(on_port && this.y > 250 - gap && this.y < 550 + gap));
	}
	/**
	* Find the point in the middle of 2 points
	* @param pos: the other point
	* @return the point in the middle of the 2 points
	*/
	Pos get_mid(Pos pos)
	{
		return new Pos((this.x + pos.x)/2, (this.y + pos.y)/2);
	}
}
