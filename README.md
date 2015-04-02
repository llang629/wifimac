# wifimac
Some public wifi hotspots limit access time. This limit is usually enforced per hardware MAC address
of the wifi interface for each computer.

To bypass such time limits, this Bash script for Macintosh computers sets the wifi MAC address to a random value.
(The second-least-significant bit of the most significant byte of the address is set to 1,
indicating a locally administered address.)

Place the script into a file named <code>wifimac.sh</code>, then execute from the terminal command line:
<pre>
  bash wifimac.sh
</pre>
Or place it into a file named <code>wifimac.command</code>, then execute by double-clicking.

Administrator password required.

The script can be re-executed periodically to start a new wifi hotspot access time period.

The MAC address will reset to default hardware value on the next computer restart.
