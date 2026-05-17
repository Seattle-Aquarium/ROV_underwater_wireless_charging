# ROV Protocols

**Location:** Seattle Aquarium, Pier 59

This document provides instructions for the main steps required to safely conduct ROV flight operations at Pier 59.
The instructions comprised here are a starting point -- we envision CEaL, IT/AV, Dive Program, and CPP to collaborate and communicate such that these protocols can be updated and improved over time.

## Table of Contents

- [Assessing topside and underwater conditions](#assessing-topside-and-underwater-conditions)
- [Set up topside flight area](#set-up-topside-flight-area)
- [Power ROV](#power-rov)
- [Stage for launch at the dive ramp](#stage-for-launch-at-the-dive-ramp)
- [Connect to the ROV](#connect-to-the-rov)
- [Deploy and fly the ROV](#deploy-and-fly-the-rov)
- [Tether management](#tether-management)
- [Docking, undocking, and wirelessly charging the ROV](#docking-undocking-and-wirelessly-charging-the-rov)
- [Retrieve ROV](#retrieve-rov)
- [Post-flight care](#post-flight-care)
- [Miscellaneous](#miscellaneous)
- [Troubleshooting](#troubleshooting)
  - [Camera stream issues](#camera-stream-issues)
  - [Unable to open BlueOS](#unable-to-open-blueos)
  - [Controller not connecting to Cockpit](#controller-not-connecting-to-cockpit)


## Assessing topside and underwater conditions

- Check weather, tides, and sea surface state before initiating a flight.
- There are a variety of ways to obtain information about the tide and wind. Two options include:
  - Tides app on iPhone
  - WindFinder app on iPhone
- Do not operate on a tide lower than 1 foot. The ramp will be too steep and/or may not reach the sea surface.
- Do not operate with winds greater than 15 knots if they are coming out of the north.
- Winds out of the south are largely blocked by Pier 59, though you may still have water movement or chop at the sea surface.
- Check water conditions via the docking station camera for visibility at depth when connected to the Aquarium network:
  - `http://10.59.165.221/extensionv2/cockpitlite/#/`
- Do not fly if you have less than 1 m of visibility.

## Set up topside flight area

- Set up a pop-up tent if required to alleviate rain, bright sun, or glare off the water.
- Unlock the ramp power box lever using the AB1 key and power the ramp by moving the switch up to the “on” position.
- Test both directions of the ramp briefly (for approximately one second) to verify functioning:
  - descend the ramp slightly;
  - ascend the ramp slightly.
- Move the ROV cart to the dive ramp, positioned such that the cart is to the right of the ramp.
- Plug in the cart to the 120 V power outlet.
- Plug in the HDMI of the TV to the ROV computer.
- Plug in the ROV computer to the power strip within the cart.
- Turn on and sign into the computer.
- Verify that the TV is duplicating the computer screen.

## Power ROV

- Check the status of the ROV battery with the voltage reader.
- Remove the vent plug and set it somewhere safe.
- Use the small Blue Robotics enclosure key to gently open the ROV battery enclosure.
- Pull the rear end cap off.
- Check the status of silicone lubrication on the two rear endcap O-rings.
  - If they are dry and/or if removal of the end cap is challenging, you can either:
    - remove the O-rings with the O-ring pick, clean them with a dust cloth, apply silicone grease, and reapply the O-rings; or
    - apply a small amount of silicone grease to the outside of the two O-rings.
- Connect the ROV:
  - attach the ROV battery’s cell balancer connector, which is white, first;
  - then connect the main connector, which is yellow.
- You should hear an initial chime when the battery is first connected and a second chime approximately one minute later when the Raspberry Pi and Navigator have fully booted.
- Use care when reconnecting the end cap:
  - ensure that all cables are out of the way;
  - ensure that the end cap can seat properly.
- Gently replace the end cap -- some pressure is necessary to fully seat the O-rings and close the enclosure.
- Attach and tighten the vent plug.

## Stage for launch at the dive ramp

- Double-check that the tether is securely clipped to the ROV.
  - The tether should be plugged in.
  - The strain relief clip should be attached.
  - If you have to manually pull in the ROV mid-flight, this clip will better protect the tether from damage.
- You require two people familiar with ROV and ramp operations: we will refer to these two roles as the
  - _Pilot_ and _Copilot_
- Both personnel are required to wear a Personal Flotation Device, or PFD, when out on the dive ramp.
  - PFDs are found on the inside door of the closet adjacent to the dive ramp.
- _Copilot_ powers the dive ramp and tests the ramp:
  - 1 second down;
  - 1 second up.
- _Pilot_ carries the ROV; _Copilot_ carries the tether.
- Both walk out to the end of the ramp and place both items at the end of the ramp.
- The _Copilot_ stays at the end of the ramp.
- The _Pilot_ returns to the cart, closing but not locking the ramp.
  - Keep the unlocked lock threaded in its spot.
- The _Copilot_ hands the tether up and over to the _Pilot_.
- The _Pilot_ verifies they have the tether with a verbal “**Got it!**” before the _Copilot_ releases the tether.
- The _Pilot_ sets the tether on the ground to the left of the cart.

## Connect to the ROV

- Connect the yellow cable to the FXTI box.
  - Align the bump along the interior rim of the plug with the white line on the spool connector.
- Connect the short yellow cable to the tether spool.
- Ensure the yellow cable is routed such that it does not impede the tether.
  - The tether should be able to freely unspool.
- Connect the USB-A cable from the FXTI box to the flight laptop’s USB-A port.
- Connect the Xbox controller to the flight laptop’s USB-A port.
- Access BlueOS, which is running on the ROV’s Raspberry Pi, by opening a Google Chrome tab and proceeding to:
  - `192.168.2.2`
- Verify the BlueOS connection.
- Check ROV voltage.
- Open the ROV laptop desktop program Cockpit.
- In Cockpit:
  - verify camera feed;
  - arm vehicle;
  - verify control;
  - check gain;
  - adjust gain to `30%`;
  - briefly check thrusters;
  - cycle lights up and down.
- The vehicle is now ready to deploy.

## Deploy and fly the ROV

- _Copilot_ is staged on the ramp with the ROV.
- _Copilot_ makes a final check to ensure vent plugs are in place and tight.
- Once the _Copilot_ is situated, they issue a verbal “**Are you ready?**” to the _Pilot_.
- _Pilot_ verifies that the vehicle is **Armed**, in **Manual**, **thrusters are responding**, and the vehicle is ready -- "**Good to go!**".
- _Pilot_ lowers the ramp to just above water level. 
- _Copilot_ gently sets the ROV in the water.
- _Pilot_ motors the ROV on the surface northwest about 10 meters away from the ramp and ascent piling.
- _Pilot_ visually confirm ROV flight controls are responding as expected.
- _Pilot_ descends the ROV.
- The CCR team conducts benthic surveys with the ROV at `20–40%` thruster gain, depending upon current.
- `20–40%` gain works well for smaller movements when investigating and exploring.
- `40–70%` gain can be utilized to cover longer distances quickly.
- You will likely not need to run the thrusters at `100%`.
  - At `100%` gain, you will have the least amount of control and ability to react quickly (just like with a vehicle on the freeway), especially given less-than-crystal-clear visibility.
- Operate the two downward and two forward lights as desired.

## Tether management

- The _Copilot_ manages tether:
  - let out slack as needed;
  - pull in slack as needed.
- **Communication is key!** Communicate so the _Copilot_ understands:
  - where the ROV is;
  - where the _Pilot_ wants to go;
  - when the _Copilot_ should anticipate the need to spool out or recover tether slack.
- Communicate and anticipate for longer runs, such as flying to the kelp between Piers 60 and 62.
- The ROV’s tether is buoyant.
- The tether is your visual guide.
  - Where the tether drops down toward the seafloor indicates where the ROV is.
- You have no other form of ROV localization.
- The placement of the tether at the surface can be shifted by wind, current, and other water movement.
- Be especially aware and alert when the tether is bunched against the pilings.
  - There are hazards that can snag the tether, especially farther under the pier.
- Do not let an excess amount of tether gather at the surface -- actively manage the tether.
- If the ROV’s forward movement is sluggish, or it cannot move forward, you may need to let out tether.
- If the tether gets wrapped around something, you can likely undo the wrap.
  - Stay calm; be patient; conduct movements carefully
  - Locate the tether via the forward-facing camera and see how the ROV's movements can "undo" the snag.
- When navigating back to the ramp in dark water, if you do not know which way to go:
  - turn around;
  - pivot the camera up;
  - find the tether;
  - follow the tether home.
- Sun glare shining down into the water can obscure the yellow tether.
- You can always ascend the vehicle to the surface to visually locate it.

## Docking, undocking, and wirelessly charging the ROV

- Align the ROV in front of the docking station.
- Place the target crosshair in the center of Cockpit.
- Gently motor forward such that UWCS Receive Coil enters the Transmit Coil.
- Higher gain, around `80%`, is useful to ensure the ROV is fully docked -- the Receive Coil has to fully enter the Transmit Coil to lock securely into place.
- Release the ROV by switching to **Manual** flight mode.
- Observe the ROV affixed in place.
  - It should not jostle extensively -- if it does, apply more forward thrust or undock and try again.
- Navigate to the WiBotic dashboard web interface at `http://10.59.165.222/#/overview`.
- Turn the transmit toggle to **On**.
- You should observe charging via icons of the Transmit and Receive Coils 
- Upon completing the charge, or upon wanting to disembark the UWCS, **Arm** the ROV (if **Disarmed**), set gain to `80%`, and gently but firmly reverse the ROV.
- Return gain to `20-70%` and resume normal ROV flight operations. 

## Retrieve ROV

- _Pilot_ has the ROV on the surface and is ready to land.
- _Copilot_ verifies ramp power.
- _Copilot_ grabs PFD.
- _Copilot_ lowers ramp to just above water level.
- _Copilot_ unlocks gate and heads out to the end of the ramp.
- _Pilot_ approaches ramp with the ROV.
- _Pilot_ switches to **Manual** flight mode.
- _Pilot_ makes final approach to the ramp and turns the ROV to the side for easy removal.
- _Copilot_, with one hand on the rail, puts the other hand on the ROV and issues a verbal “**Got it!**” to the Pilot.
- _Pilot_ then responds “**Manual!**” to verify the ROV is ready to retrieve.
  - Pulling the ROV out of the water in **Stabilize** or **Depth Hold** will result in the thrusters continuing to fire in an attempt to minimize ROV movement.
  - In other words, you will get wet as the ROV is pulled out of the water! Make sure the ROV is in **Manual**.
- _Copilot_ lifts ROV out of the water.
- _Pilot_ **Disarms** vehicle and raises ramp.
- _Copilot_ observes the tether and makes sure it will raise properly as the ramp ascends. 
- _Pilot_ spools up and clears tether.

## Post-flight care

- Take the ROV and tether to the back of Pier 59 and spray thoroughly with freshwater from the hose.
- Focus particularly on:
  - thrusters;
  - areas with wire connections;
  - any exposed metal.
- Once the ROV has been rinsed, use a microfiber towel to remove excess water from the battery enclosure area.
- Power down the ROV: remove the vent plug from the battery enclosure, open the enclosure via the key, and disconnect the battery.
- Reattach the battery enclosure panel.
- Notice that the back panel requires a specific configuration to be reattached properly.
  - The rim has a notch that must interlock with the cutout portion of the enclosure tube.
- Replace vent plug.
- Stow ROV and tether in the cart and wheel to old PCR habitats in shark holding.

## Miscellaneous

- Do not leave the ROV electronics enclosure exposed to direct sunlight for too long, as UV can turn the acrylic opaque.
  - Place a towel over the top on sunny days when standing by for longer than five minutes. 
  - Give the ROV a hat!
- Avoid hard landings both on land and in the water to avoid degrading the payload skid.
  - Do not drop the ROV.

## Troubleshooting

- Most software issues can be resolved by cycling the power, i.e., turning the ROV off and on.
- In BlueOS:
  - click the power icon at the bottom of the left panel;
  - select “Restart Autopilot” from the pop-up;
  - allow the ROV a minute or two to correct.
- If that fails to resolve the issue:
  - select “Reboot” from the pop-up;
  - wait for the ROV to power cycle;
  - listen for the chimes.
- You can also shut down the ROV via BlueOS:
  - unplug the battery;
  - wait a minute;
  - re-plug the battery.
- This is a full restart.

### Camera stream issues

- If the camera stream is not working, confirm:
  - the ROV is powered;
  - the laptop is connected to the ROV;
  - Cockpit is open;
  - the correct video stream is selected.

### Unable to open BlueOS

- Close the browser with BlueOS.
- Unplug the FXTI USB from the laptop.
- Plug the FXTI USB back into the laptop.
- Reopen BlueOS.

### Controller not connecting to Cockpit

- Unplug the controller from the laptop.
- Plug the controller back into the laptop.
