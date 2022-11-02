//ActionScript 3.0 Adjusting Gravity
//dev: https://www.linkedin.com/in/efegunes/

//WHEN KEYS PRESSED

stop ();

function keyPressed(event:KeyboardEvent)
{
	
	if (event.keyCode == Keyboard.RIGHT)
	{
		rightPress = true;
	}
	
	if (event.keyCode == Keyboard.LEFT)
	{
		leftPress = true;
	}
	
	if (event.keyCode == Keyboard.UP)
	{
		if(!upPress && onground)
		{
			runJump();
		}
		upPress = true;
	}
	
}

//JUMPING POWER

stop ();

function runJump()
{
	onground = false;
	yvelocity =-9;
}

//WHEN KEYS RELEASED

stop ();

function keyRelease(event:KeyboardEvent)
{
	
	if (event.keyCode == Keyboard.RIGHT)
	{
		rightPress = false;
	}
	
	if (event.keyCode == Keyboard.LEFT)
	{
		leftPress = false;
	}
	
	if (event.keyCode == Keyboard.UP)
	{
		upPress = false;
	}
	
}

//PLATFORM GROUND

stop ();

function physic()
{
	character.x += xvelocity;
	character.y += yvelocity;
	
	xvelocity *= Friction;
	yvelocity += Gravity;
	
	while(ground.hitTestPoint(character.x,character.y,true))
	{
		onground = true;
		character.y--;
		yvelocity = 0;
	}
}