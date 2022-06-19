within ;
package FluxTubesExtension "Extension of the Magnetic.FluxTubes package"
  extends Modelica.Icons.Package;
  import Modelica.Units.SI;
  import Modelica.Constants.mu_0;

  annotation (preferredView="info", uses(Modelica(version="4.0.0")), Icon(graphics={
    Polygon(
      origin={-3.75,0},
      fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      points={{33.75,50.0},{-46.25,50.0},{-46.25,-50.0},{33.75,-50.0},{33.75,-30.0},{-21.25,-30.0},{-21.25,30.0},{33.75,30.0}}),
    Ellipse(
      origin={10.4708,41.6771},
      extent={{-86.0,-24.0},{-78.0,-16.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-20.0},{-78.0,-20.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.1812,-31.6229},{-32.0,-40.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-20.0},{-32.0,-28.0}}),
    Ellipse(
      origin={10.4708,41.6771},
      extent={{-86.0,-60.0},{-78.0,-52.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-56.0},{-78.0,-56.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-44.0},{-32.0,-52.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-56.0},{-32.0,-64.0}}),
    Rectangle(
      origin={62.5,0},
      fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      extent={{-12.5,-50.0},{12.5,50.0}})}),
  Documentation(info="<html>
<p>
This library contains extensions to the <a href=\"modelica://Modelica.Magnetic.FluxTubes\">Magnetic.FluxTubes package</a>, 
mainly with respect to an alternative <a href=\"modelica://FluxTubesExtension.UsersGuide.ApproximationSoftMagnetic\">representation of the characteristics of soft magentic material</a>.
</p>
<p>
It is intended to include these extensions in the Modelica Standard Library after extensive testing.
</p>

<h4>Main author</h4>

<p>
<a href=\"https://www.oth-regensburg.de/en/faculties/electrical-engineering-and-information-technology.html\"><strong>Prof. Anton Haumer</strong></a><br>
    OTH Regensburg<br>
    Faculty of Electrical Engineering and Information Technology<br>
    93053 Regensburg, Germany<br>
    email: <a href=\"mailto:Anton.Haumer@oth-regensburg.de\">Anton.Haumer@oth-regensburg.de</a>
</p>
</html>"));
end FluxTubesExtension;
