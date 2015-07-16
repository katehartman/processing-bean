/*
Based on "processing_bean" by Boris Kourtoukov
 Modified by Kate Hartman 
 A simplified example meant to work with 1 sensor on pin A0
 
 Workshop participants:
 Modify the graphics below!
 */

Connection osc = new Connection();

void setup() {
  size( 1024, 768 );
  frameRate( 60 );
}

void draw() {
  background(200);

  if ( osc.devices != null ) {
    // Loop over the array of current devices.
    for (int i = 0; i < osc.devices.length; i++) {
      Device bean = osc.devices[i]; // Store the current device for ease of access.

      // Calculate the width of the screen for the bean to take up. 
      int bean_area = width / osc.devices.length; 

      noStroke();

      //alternate colors for every other bean
      if (i % 2 == 0) {
        fill(250, 75, 200);
      } else {
        fill(22, 221, 53);
      }

      //get the bean value and map it to the height
      //change the number in bean.get to whatever you need
      float beanValue = map(bean.get(5), 0, 1000, 0, height); 
      // Display a rectangle for whose height represents the sensor value
      rect(i * bean_area, height-beanValue, bean_area, height);

      // display the bean name
      fill(0);
      text(bean.name, i * bean_area + 6, 21 );

      // display the bean value
      fill(0);
      text(beanValue, i * bean_area + 6, 41 );
    }
  }
}

