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

-	**Check weather, tides, and sea surface state before initiating flight protocol.** There are a variety of ways to obtain information about the tide, wind. Two options include:
  -	Tides app on IOS
  -	WindFinder app on IOS
-	**Do not operate on a tide lower than 1 foot** (the ramp will be too steep / can’t reach the sea surface)
-	**Do not operate with winds greater than 15 knots** if out of the north.
  -	Winds out of the south are largely blocked by Pier 59, though you may have water movement / chop.
-	Check water conditions via docking station camera for visibility at-depth
  -	http://10.59.165.221/extensionv2/cockpitlite/#/
  -	**Do not fly if you have less than 1m of visibility**

## Set up topside flight area

-	(Optional) Set up a pop-up tent to alleviate rain / bright sun or glare off the water. 
-	Unlock ramp power box lever using AB1 key and power the ramp via moving the switch up to the “on” position. 
-	Test both directions of the ramp to verify functioning -- descend the ramp slightly, then ascend the ramp slightly. 
-	Move cart to the dive ramp, positioned such that the cart is just to the right of the end of the ramp.
-	Plug in the cart to the 120V power outlet.
-	Plug in the HDMI cord to the TV and ROV laptop.
-	Plug in the ROV laptop to the power strip within the cart.
-	Turn on and sign into the laptop, verify TV duplicating computer screen.

## Power ROV

- Check the status of the ROV battery with the voltage reader by connecting the white terminals.
- Remove the vent plug and **set it somewhere safe.**
- Use the small Blue Robotics enclosure key to gently open the ROV battery enclosure.
  - Find an opening groove between the end cap and battery enclosure, insert the middle protrusion of the key, then twist the key.
- Pull the rear end cap off.
-	**Check the status of silicone lubrication on the two rear endcap O-rings.**
  -	If they are dry and/or if removal of the end cap is challenging, you can either:
    -	Remove the O-rings with the O-ring pick, clean them with a dust cloth, apply silicone grease, reapply the O-rings, or 
    -	Apply a small amount of silicone grease to the outside of the x2 O-rings
  - Remove any hairs or particles from the O-rings as even small debris can compromise the seal and flood the battery enclosure.
    - Remove and clean with dust cloth if necessary, then reapply silicone grease and replace.
-	Connect the ROV: attach the ROV battery’s cell balancer connector **(white) first**, then connect the main connector (yellow). You should hear an initial chime when the battery is first connected, and a second chime approximately one minute later when the Pi and Navigator have fully booted.
  - The ROV will not be ready to fly until both series of chimes occur.
-	Gently replace the end cap; **the cap should rest flush against the tube**, with two solid black lines forming inside where the O-rings make contact with the tube.
-	Care is required when re-connecting the end cap -– ensure that all cables are out of the way and that the end cap can seat properly, then match the rectangular notch (located about a cm up from the bottom) to fit the groove in the acrylic tube. Pause if you feel resistance when attempting to replace the end cap.
-	**Reattach and tighten the vent plug.**

## Stage for launch at the dive ramp

-	**Double-check that the tether is securely clipped to ROV** (i.e., that the tether is plugged in and that its strain relief clip is attached –- should you have to manually pull in the ROV mid-flight, this clip will better protect the tether from damage). 
-	You require x2 people familiar with ramp operations –- the *Pilot* and the *Copilot* -– both personnel are **required to wear a Personal Floatation Device** (PFD; found on the inside door of the closet adjacent to the dive ramp) when walking on the ramp.  
-	With the *Pilot* carrying the ROV and *Copilot* carrying the tether spool both walk out and place their items at the end of the ramp.
-	The *Copilot* stays at the end of the ramp; the *Pilot* returns to the cart, closing but not locking the ramp (keep the unlocked lock threaded in its spot so as not to lose it).
-	The *Copilot* hands the tether spool to the *Pilot* from the ramp, where, **upon handoff, the *Pilot* will verify their grip on the spool via a verbal “Got it!” before the *Copilot* releases their grip.**
-	The *Pilot* sets the tether on the ground to the left of the cart.

## Connect to the ROV

-	Connect the yellow cable to the FXTI box and tether spool (align the bump along the interior rim of the plug with the white line on the spool connector).
-	**Ensure the yellow cable is routed such that does not impede the tether**, i.e., ensure the tether can freely unspool.  
-	Connect the USB-A cable from the FXTI box to the flight laptop’s USB-A port.
-	Connect the Xbox controller to another flight laptop USB-A port.
-	Access BlueOS by opening Chrome and proceeding to `192.168.2` (type this directly into the seach bar).
  -	Verify BlueOS connection.
    - If the page cannot open, wait a moment, then close the tab and try unplugging and replugging the FXTI USB-A wire.
  - Check ROV voltage and heartbeat.
    - This can be done by clicking the leftmost option in the top right corner of the BlueOS page.
-	Open ROV laptop desktop application "Cockpit".
  -	Verify camera feed is visible on-screen.
  -	Arm vehicle.
  -	Verify control: check gain, adjust to `30%`. 
  -	Briefly activate thrusters.
  -	Cycle lights up and down.
-	The vehicle is now ready to deploy.

## Deploy and fly the ROV

-	*Pilot* lowers ramp with *Copilot* and ROV until just above water level.
-	*Copilot* makes a final check to ensure vent plugs are in place and tight.
-	*Copilot* issues a verbal “**Are you ready?**” to the *Pilot*.
- *Pilot* verifies that the vehicle is **armed and set to "Manual" flight mode**. 
-	*Copilot* gently sets the ROV in the water.
- *Copilot* returns to cart and ascends the ramp to be slightly above the water line.
-	*Pilot* motors the ROV on the surface northwest about 10 meters away from the ramp and ascent piling; visually confirm ROV flight controls are responding as expected.
-	*Pilot* descends the ROV.
-	CCR team surveys with the ROV at 20-40% thruster gain, depending upon current.
  -	20-40% gain works well for smaller movements when investigating and exploring.
  -	40-70% gain can be utilized to cover longer distances quickly.
  -	It is not recommended to run the thrusters at 100% as not only does the ROV become difficult to control but it may fry the electronics if used for extended periods.
-	(Optional) Operate the x2 downward and x2 forward lights as desired. 

## Tether management

- The *Copilot* manages the tether while the *Pilot* flies; they should let out and pull in slack as needed.
- **Communication is key!** Communicate so the *Copilot* understands:
  - where the ROV is;
  - where the *Pilot* wants to go;
  - when the *Copilot* should anticipate the need to spool out or recover tether slack.
- The ROV’s tether is buoyant and serves as your only visual locator for the ROV when at-depth.
- Be mindful that the placement of the tether at the surface can be shifted by wind, current, and other water movement.
- Do not let an excess amount of tether gather at the surface -- actively manage the tether.
  - Be especially aware and alert when the tether is bunched against the pilings to avoid entanglement.
    - There are hazards that can snag the tether, especially farther under the pier.
- If the ROV’s forward movement is sluggish, or it cannot move forward, you may need to let out tether.
- If the tether gets wrapped around something, you can likely undo the wrap using the ROV and the *Copilot's* position on land.
  - Stay calm; be patient; conduct movements carefully.
  - Locate the tether via the forward-facing camera and see how the ROV's movements can "undo" the snag.
- When navigating back to the ramp in dark water, if you do not know which way to go:
  - turn around;
  - pivot the camera up;
  - find the tether;
  - follow the tether home.
- Sun glare shining down into the water can obscure the yellow tether.
- You can always ascend the vehicle to the surface to visually locate it.

## Docking, undocking, and wirelessly charging the ROV

-	Align the ROV in front of the docking station. 
-	Place the target cross in the center of Cockpit. 
-	Gently motor forward such that the ROV's "nose" enters the docking station port, then up the gain to at least 70% and pilot forward to ensure a full connection.
-	Release the ROV via switching to Manual flight mode; observe the ROV affixed in place, i.e., it should jostle extensively but display a clear hold to the station (i.e., doesn’t float up/away). 

- On the ROV laptop, navigate to the WiBotic dashboard web interface at `http://10.59.165.222/#/overview`.
- Turn the transmit toggle to **On**.
  - You should observe charging via icons of the Transmit and Receive Coils 
- Upon completing the charge, or upon wanting to disembark the station, **Arm** the ROV (if **Disarmed**), set gain to `70%`, and gently but firmly reverse the ROV.
- Return gain to `20-40%` and resume normal ROV flight operations. 

## Retrieve ROV

- *Pilot* has the ROV at the surface and is ready to land.
- *Copilot* dons PFD.
- *Copilot* lowers ramp to touching water level.
- *Copilot* unlocks gate, hangs lock in its hold, and descends along the ramp.
- *Pilot* approaches ramp with the ROV.
- *Pilot* switches to **Manual** flight mode.
- *Pilot* makes final approach to the ramp and turns the ROV to the side for easy removal.
- *Copilot*, with one hand on the rail, puts the other hand on the ROV and issues a verbal “**Got it!**” to the *Pilot*.
- *Pilot* then responds “**Manual!**” to verify the ROV is ready to retrieve.
  - Pulling the ROV out of the water in "**Stabilize**" or "**Depth Hold**" flight modes will result in the thrusters continuing to fire in an attempt to minimize ROV movement (i.e., you will get splashed as the ROV is pulled out of the water!).
- *Copilot* lifts ROV out of the water and gently sets on ramp.
- *Pilot* **Disarms** vehicle and raises ramp.
- *Copilot* observes the tether and makes sure it will raise properly as the ramp ascends. 
- *Pilot* spools up and clears excess tether.
- *Pilot* hands tether spool over to *Copilot* (again, verifying a grip on the spool before letting go).
- *Pilot* dons PFD and joins the *Copilot* on ramp before retunging with ROV and spool.

## Post-flight care

- Take the ROV and tether spool to the back of Pier 59 and spray thoroughly with freshwater from the hose.
  - Focus particularly on:
    - thrusters;
    - areas with wire connections;
    - any exposed metal.
- Once the ROV has been rinsed, use a microfiber towel to remove excess water from the battery enclosure area.
- Power down the ROV: remove the vent plug from the battery enclosure and store somewhere safe, open the enclosure using the key, and disconnect the battery wires.
- Reattach the battery enclosure panel **without** the battery inside.
- Replace vent plug.
- Stow ROV and tether in the cart and wheel to old PCR habitats in shark holding.

## Miscellaneous

- Do not leave the ROV electronics enclosure exposed to direct sunlight for too long, as UV can turn the acrylic opaque.
  - Place a towel over the top on sunny days when standing by for longer than five minutes and/or give the ROV a fun hat!
- Whenever you need a better angle to perform work on the ROV (e.g., when removing/attaching the battery), avoid supporting the full weight of the ROV on its “nose,” any wires, or other small points of contact.
- Avoid hard landings both on land and in the water to avoid degrading the payload skid (do not drop the ROV!).

## Troubleshooting

- Most software issues can be resolved by cycling the power (turning the ROV off and on).
- In BlueOS:
  - Click the power icon at the bottom of the left panel;
  - Select "RESTART CORE CONTAINER” from the pop-up;
  - Allow the ROV a minute or two to correct.
- If that fails to resolve the issue:
  - Select "REBOOT" from the pop-up;
  - Wait for the ROV to power cycle;
  - Listen for the chimes.
- You can also shut down the ROV via BlueOS:
  - Unplug the battery;
  - Wait a minute;
  - Re-plug the battery.
  - This is a full restart.

### Camera stream issues

- If the camera stream is not working, confirm:
  - The ROV is powered;
  - The laptop is connected to the ROV;
  - Cockpit is open;
  - The correct video stream is selected.

### Unable to open BlueOS

- Close the browser with BlueOS.
- Unplug the FXTI USB from the laptop.
- Plug the FXTI USB back into the laptop.
- Reopen BlueOS.

### Controller not connecting to Cockpit

- Unplug the controller from the laptop.
- Plug the controller back into the laptop.
