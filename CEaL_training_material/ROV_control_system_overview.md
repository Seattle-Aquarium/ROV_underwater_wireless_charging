## ROV control system overview

Our BlueROV2 uses several pieces of hardware and software that work together. 
You do not need to understand all of the engineering details, but it would be helpful to have a basic understanding of the system and its constituent hardware (ROV laptop, Raspberry Pi, Navigator) and software (Cockpit, BlueOS, ArduSub).

At a high level:   

- The **ROV laptop** is where you the pilot will use the desktop app **[Cockpit](https://bluerobotics.com/cockpit/)** to fly the ROV. 
- The Raspberry Pi (**[Pi](https://bluerobotics.com/store/comm-control-power/control/raspberry-pi/)**) in the ROV is the onboard computer that helps manage the ROV.  
- The Navigator Flight Controller (**[Navigator](https://bluerobotics.com/store/comm-control-power/control/navigator/)**) is the control board atop the Pi that connects the computer to vehicle hardware such as thrusters and lights. 
- **[ArduSub](https://ardupilot.org/sub/)** on the Pi is the ROV autopilot firmware that turns pilot commands into vehicle actions via the Navigator and its physical connections to the ROV hardware.   
- **[BlueOS](https://blueos.cloud/docs/stable/usage/overview/)** on the Pi is the onboard web-based management system used to access ROV settings and software.   

## Main hardware components

### ROV laptop
The ROV laptop is the topside computer used by the pilot. 
It stays above the water and connects to the ROV through the tether.
The laptop is used to open the desktop program Cockpit to control the ROV and BlueOS wia a web browser at `192.168.2.2` to access ROV settings and update or configure software when needed.
The laptop also allows you to view video from the ROV camera and control the ROV with a Xbox controller. 
The ROV laptop is the main system hardware that you will interact with directly. 

### Raspberry Pi
The Raspberry Pi is a small onboard computer inside the ROV. 
It is similar in concept to a small desktop computer, but it is mounted inside the vehicle and runs the software needed to manage the ROV.
The Raspberry Pi is responsible for running **BlueOS**, which provides the browser-based interface used to manage the ROV. 
It also helps pass information between the pilot laptop, the ROV camera, sensors, and the flight-control system.
The Raspberry Pi is the ROV’s onboard “computer hub.” It does not directly replace the pilot, and it does not physically power the motors by itself, but it helps coordinate communication among the systems inside the vehicle.

### Navigator Flight Controller
The Navigator is a control board mounted with the Raspberry Pi. 
It connects the onboard computer to the physical hardware of the ROV, including thrusters, lights, sensors, and other electronics.
The Navigator includes sensors that help the ROV understand its motion and orientation via compasses and Inertial Measurement Units (IMUs) such that the ROV's software and pilot have real-time access to ROV tilt, orientation, and depth. 
It also provides the electrical connections used to send control signals to the ROV’s hardware such as thrusters and lights. 
The Navigator is the ROV’s “nervous system interface” and this connectivity is facilitated by ArduSub which is installed on the Navigator.  
It connects the onboard computer to the parts of the ROV that sense and move.

## Main software and firmware components

### ArduSub
ArduSub is the autopilot firmware used by the ROV.
Firmware is software that runs close to the hardware and controls how the vehicle behaves. 
ArduSub is installed on the Navigator, and the installation and updating of the firmware is managed by BlueOS. 
ArduSub receives commands from the pilot, such as “move forward,” “turn,” “rise,” or “turn on the lights,” and translates those commands into signals for the ROV’s thrusters, lights, and other hardware.
For example, when a pilot pushes the joystick forward, ArduSub helps determine how the thrusters should spin so that the ROV moves forward in a controlled way.
Crucially, ArduSub senses how the ROV is moving via the compass and IMUs within the Navigator, and it integrates that information alongside the pilot commands to produce smooth and precise vehicle movement. 
ArduSub is the ROV’s “reflexes and movement-control system.” 
It handles the low-level control that makes the vehicle respond smoothly to pilot commands.

### BlueOS
BlueOS is the operating and management system that runs on the Raspberry Pi inside the ROV. 
You will access BlueOS on the ROV laptop using a web browser and the IP address `192.168.2.2`
BlueOS is used to check the status of the ROV, configure vehicle settings, install or update BlueOS, ArduSub, and BlueOS extensions, manage network connections, view connected devices, access tools and BlueOS Extensions.
Think of it like the ROV’s onboard settings and management dashboard.

### Cockpit
Cockpit is the software interface used by the pilot to operate the ROV. 
It runs on the ROV laptop and provides the main flight screen.
With Cockpit you will view the ROV camera feed and control the ROV, monitor vehicle information such as battery voltage, monitor compass heading and vehicle orientation, control lights and video recordings. 
