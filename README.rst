===========================
 Ciril: a Cubic Inch Robot
===========================

The ESP8266 opens up new possibilities for hardware
design of educational robots.  This project aims to
put together an open hardware design compatible with
the `Flobot <http://github.com/mnemote/flobot>`_ project and also 
projects such as `NodeMCU <http://nodemcu.com/>`_.

The eventual aim is for dimensions of approximately
1 cubic inch (25 x 25 x 25 mm = 16 cubic centimeters),
but the immediate goal is approximately 40 x 40 x 40 mm
(4 cubic inches).

The main board features two miniature stepper motors 
soldered directly to the PCB and driving two very small 
wheels.  It is designed to run around on a desktop so 
very little ground clearance is needed.

An ESP12-E module is soldered directly to the main board
with its antenna protruding over the edge of the main board
to reduce signal interference.

A micro-USB port allows charging the built-in LiPo battery
and reflashing the ESP8266 via a serial port converter.

Sensors include a line-following sensor, ambient light sensor
and an ultrasonic range sensor.

A 3D printed shell on the top and bottom of the robot provides
protection and physical support.  The lower shell supports the
motors, light guides for the line-following sensors and has skids
at either end.  The upper shell has a rounded, childs-hand-friendly
shape, with cutouts to expose the range sensor and reveal the PCB
and battery inside.

.. image:: img/ciril.png
    :width: 50%
    :class: center

Very much just started development!
