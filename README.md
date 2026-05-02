# ROV underwater wireless charging 

## Overview 

This prototype deployment of the [Underwater Wireless Charging System](https://bluerobotics.com/store/comm-control-power/powersupplies-batteries/underwater-wireless-charging-system/) (UWCS) at the Seattle Aquarium seeks to take a small step towards scalable, fully autonomous underwater robotics. 
To do so, we demonstrate wireless underwater ROV charging using [Wibotic](https://www.wibotic.com/) technology to recharge a [Blue Robotics](https://bluerobotics.com/) BlueROV2. 

This customized deployment was facilitated by University of Washington's [Applied Physics Lab](https://apl.uw.edu/) (APL), with funding from [Schmidt Marine Technology Partners](https://schmidtmarine.org/), and in collaboration with Blue Robotics and WiBiotic.  

<p align="center">
  <img
    src="https://github.com/user-attachments/assets/c049ad2d-7e81-4e4b-8aa2-52fd579d9f79"
    alt="ROV docking station wide view"
    width="40%"
    height="280"
  />
  <img
    src="https://github.com/user-attachments/assets/646f75a8-aef2-4f49-a14f-3ab3e485fb86"
    alt="ROV docking station close view"
    width="40%"
    height="280"
  />
</p>

## Objectives

1. Demonstrate underwater wireless ROV battery charging and monitor the system over time to evaluate any issues that may develop over time.
   
2. Enable the Seattle Aquarium's Conservation Engagement and Learning (CEaL) department and Vistor Engagement, School and Public Programs, Community Engagement, and Volunteer Engagement teams to develop novel outreach and engagement experiences centered around the UWCL, the associated ROV, and the UWCL's Low-Light camera. 
    
3. Provide a platform that will enable further development and testing of autonomous ROV flight control software. 

This repository provides a location for documentation and issues regarding the prototype deployment of a [Blue Robotics](https://bluerobotics.com/) (BR) and [Wibotic](https://www.wibotic.com/) [Underwater Wireless Charging System](https://bluerobotics.com/store/comm-control-power/powersupplies-batteries/underwater-wireless-charging-system/) at the Seattle Aquarium's Pier 59.

## Low-Light USB Camera 

The prototype UWCL deployment also includes a Blue Robotics [Low-Light HD USB Camera](https://bluerobotics.com/store/sensors-cameras/cameras/cam-usb-low-light-r1/) within a standard Blue Robotics acrylic tube, enabling: 

- 24/7 video stream
- Control over tilt and four BR lights from within Cockpit Lite
- Custom recording and control via BlueOS Extension _blueos-timelapse-controller_

<div align="center">
  <img width="400" height="190" alt="tilt_GIF" src="https://github.com/user-attachments/assets/1111cc8e-037c-41e8-b76d-a1ab764c0d81" />
  <img width="400" height="190" alt="light_GIF" src="https://github.com/user-attachments/assets/975f6728-a05e-42e7-9337-2a21ee659edf" />
</div>

