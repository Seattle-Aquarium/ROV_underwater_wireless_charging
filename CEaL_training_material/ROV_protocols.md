# ROV Protocols

**Location:** Seattle Aquarium, Pier 59

This document provides instructions for the main steps required to safely conduct ROV flight operations at Pier 59.

## Assessing topside and underwater conditions

- Check weather, tides, and sea surface state before initiating flight protocol.
- There are a variety of ways to obtain information about the tide and wind. Two options include:
  - Tides app on iPhone
  - WindFinder app on iPhone
- Do not operate on a tide lower than 1 foot. The ramp will be too steep and/or may not reach the sea surface.
- Do not operate with winds greater than 15 knots if they are coming out of the north.
- Winds out of the south are largely blocked by Pier 59, though you may still have water movement or chop.
- Check water conditions via the docking station camera for visibility at depth:
  - `http://10.59.165.221/extensionv2/cockpitlite/#/`
- Do not fly if you have less than 1 m of visibility.

## Set up topside flight area

- Set up a pop-up tent if required to alleviate rain, bright sun, or glare off the water.
- Unlock the ramp power box lever using the AB1 key and power the ramp by moving the switch up to the “on” position.
- Test both directions of the ramp to verify functioning:
  - descend the ramp slightly;
  - ascend the ramp slightly.
- Move the cart to the dive ramp, positioned such that the cart is to the right of the ramp.
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
- Gently replace the end cap.
- Attach and tighten the vent plug.

## Stage for launch at the dive ramp

- Double-check that the tether is securely clipped to the ROV.
  - The tether should be plugged in.
  - The strain relief clip should be attached.
  - If you have to manually pull in the ROV mid-flight, this clip will better protect the tether from damage.
- You require two people familiar with ramp operations:
  - Pilot
  - Copilot
- Both personnel are required to wear a Personal Flotation Device, or PFD, when out on the dive ramp.
  - PFDs are found on the inside door of the closet adjacent to the dive ramp.
- Copilot powers the dive ramp and tests the ramp:
  - 1 second down;
  - 1 second up.
- Pilot carries the ROV.
- Copilot carries the tether.
- Both walk out to the end of the ramp and place both items at the end of the ramp.
- The Copilot stays at the end of the ramp.
- The Pilot returns to the cart, closing but not locking the ramp.
  - Keep the unlocked lock threaded in its spot.
- The Copilot hands the tether up and over to the Pilot.
- The Pilot verifies they have the tether with a verbal “Got it!” before the Copilot releases the tether.
- The Pilot sets the tether on the ground to the left of the cart.

## Connect to the ROV

- Connect the yellow cable to the FXTI box.
  - Align the bump along the interior rim of the plug with the white line on the spool connector.
- Connect the short yellow cable to the tether spool.
- Ensure the yellow cable is routed such that it does not impede the tether.
  - The tether should be able to freely unspool.
- Connect the USB-A cable from the FXTI box to the flight laptop’s USB-A port.
- Connect the Xbox controller to the flight laptop’s USB-A port.
- Access BlueOS, which is running on the ROV’s Raspberry Pi, by opening a Google Chrome tab and proceeding to:
  - `192.168.2`
- Verify the BlueOS connection.
- Check ROV voltage.
- Open the ROV laptop desktop program Cockpit.
- In Cockpit:
  - verify camera feed;
  - arm vehicle;
  - verify control;
  - check gain;
  - adjust gain to 30%;
  - briefly check thrusters;
  - cycle lights up and down.
- The vehicle is now ready to deploy.

## Deploy and fly the ROV

- The Copilot is staged on the ramp with a **[NOTE: source text appears incomplete here]**.
- The Pilot lowers the ramp with the Copilot and ROV just above water level.
- Copilot makes a final check to ensure vent plugs are in place and tight.
- Copilot issues a verbal “Are you ready?” to the Pilot.
- Pilot verifies that the vehicle is armed and ready.
- Copilot gently sets the ROV in the water.
- Pilot motors the ROV on the surface northwest about 10 meters away from the ramp and ascent piling.
- Visually confirm ROV flight controls are responding as expected.
- Descend the ROV.
- The CCR team surveys with the ROV at 20–40% thruster gain, depending upon current.
- 20–40% gain works well for smaller movements when investigating and exploring.
- 40–70% gain can be utilized to cover longer distances quickly.
- You will likely not need to run the thrusters at 100%.
  - At 100% gain, you will have the least control and ability to react quickly, especially given less-than-crystal-clear visibility.
- Operate the two downward and two forward lights as desired.

## Tether management

- The Copilot manages tether:
  - let out slack as needed;
  - pull in slack as needed.
- Communicate so the Copilot understands:
  - where the ROV is;
  - where the Pilot wants to go;
  - when the Copilot should anticipate the need to spool out or recover tether slack.
- Communicate and anticipate for longer runs, such as flying to the kelp between Piers 60 and 62.
- The ROV’s tether is buoyant.
- The tether is your visual guide.
  - Where the tether drops down toward the seafloor indicates where the ROV is.
- You have no other form of ROV localization.
- The placement of the tether at the surface can be shifted by wind, current, and other water movement.
- Be especially aware and alert when the tether is bunched against the pilings.
  - There are hazards that can snag the tether, especially farther under the pier.
- Do not let an excess amount of tether gather at the surface.
- Actively manage the tether.
- If the ROV’s forward movement is sluggish, or it cannot move forward, you may need to let out tether.
- If the tether gets wrapped around something, you can likely undo the wrap.
  - Stay calm.
  - Be patient.
  - Conduct movements carefully.
- When navigating back to the ramp in dark water, if you do not know which way to go:
  - turn around;
  - pivot the camera up;
  - find the tether;
  - follow the tether home.
- Sun glare shining down into the water can obscure the yellow tether.
- You can always ascend the vehicle to the surface to visually locate it.

## Docking, undocking, and wirelessly charging the ROV

- Align the ROV in front of the docking station.
- Place the target cross in the center of Cockpit.
- Gently motor forward such that the stab of the UWCS enters the receiver.
- Higher gain, around 80%, is useful to ensure the ROV is fully docked.
- Release the ROV by switching to Manual flight mode.
- Observe the ROV affixed in place.
  - It should not jostle extensively.

## Retrieve ROV

- Pilot has the ROV on the surface and is ready to land.
- Copilot verifies ramp power.
- Copilot grabs PFD.
- Copilot lowers ramp to just above water level.
- Copilot unlocks gate and heads out to the end of the ramp.
- Pilot approaches ramp.
- Pilot switches to Manual.
- Pilot makes final approach and side turn for easy removal.
- Copilot, with one hand on the rail, puts the other hand on the ROV and issues a verbal “Got it!” to the Pilot.
- Pilot then responds “Manual!” to verify the ROV is ready to retrieve.
  - Pulling the ROV out of the water in Stabilize or Depth Hold will result in the thrusters continuing to fire in an attempt to minimize ROV movement.
  - In other words, you will get wet as the ROV is pulled out of the water.
- Copilot lifts ROV out of the water.
- Pilot disarms vehicle and raises ramp.
- Pilot spools up and clears tether.

## Post-flight care

- Take the ROV and tether to the back of Pier 59 and spray thoroughly with freshwater from the hose.
- Focus particularly on:
  - thrusters;
  - areas with wire connections;
  - any exposed metal.
- Once the ROV has been rinsed, remove the vent plug from the battery enclosure and disconnect the battery.
- Reattach the battery enclosure panel.
- Notice that the back panel requires a specific configuration to be reattached properly.
  - The rim has a notch that must interlock with the cutout portion of the enclosure tube.
- Replace vent plug.
- Stow ROV and tether in the cart and wheel to old PCR habitats in shark holding.

## Miscellaneous

- Do not leave the ROV electronics enclosure exposed to direct sunlight for too long, as UV can turn the acrylic opaque.
  - Place a towel over the top on sunny days during standby.
  - Give the ROV a hat!
- Avoid hard landings both on land and in the water to avoid degrading the payload skid.
  - Do not drop the ROV.

## Troubleshooting

- Most software issues can be resolved by cycling the power, meaning turning the ROV off and on.
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