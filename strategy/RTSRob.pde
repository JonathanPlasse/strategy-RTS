/**
 * This class represent our robot
 */
class RTSRob extends Robot
{
    /* The weathercock's color detected by our robot */
    int detected_color;

    /* A boolean that indicate if the flag is deployed*/
    boolean flag_deployed;

    /**
	 * Constructor of our robot 
	 * @param pos: the initial position of the robot
	 * @param angle: the initial position of the robot
     * @param sensors: the list of sensors of our robot
	 */
    RTSRob(Pos position, float angle, ArrayList<Sensor> sensors)
    {
        super(position, angle, sensors);
        this.detected_color = NO_COLOR;
        this.flag_deployed = false;
    }

    /**
	 * Draw our robot, with the sensors if they can be reresented
	 */
    @Override
    void draw_robot()
    {
         pushMatrix();
        
		fill(0, 255, 0);
		translate(this.position.x, this.position.y);
		rotate(this.angle);
		rectMode(CENTER);
		rect(0, 0, ROBOT_WIDTH, ROBOT_HEIGHT);
        fill(255, 255, 255);
		triangle(ROBOT_HEIGHT/2, 0, 0, -ROBOT_WIDTH/2, 0, ROBOT_WIDTH/2);
        for(int i = 0; i < this.sensors.size(); i++)
            this.sensors.get(i).draw();

        popMatrix();
    }
}
