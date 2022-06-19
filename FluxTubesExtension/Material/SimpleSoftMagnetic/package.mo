within FluxTubesExtension.Material;
package SimpleSoftMagnetic "Characteristics B(H) of common soft magnetic materials acc. to Macfadyen"
  extends Modelica.Icons.MaterialPropertiesPackage;

  annotation (Documentation(info="<html>
<p>
The magnetisation characteristics B(H) of all soft magnetic materials currently included in this library are approximated with a <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SimpleSoftMagnetic.BaseData\">function</a>. 
Each material is characterised by the parameters of this function. The approximated characteristics B(H) for most of the ferromagnetic materials currently included 
are shown in the plots below (solid lines) together with the original data points compiled from measurements and literature.
</p>
<p>
The following materials (E-Sheet I, E-Sheet IV, Cast Steel, Rolled Steel, Cast Iron) are used for education at 
<a href=\"https://www.oth-regensburg.de/en/faculties/electrical-engineering-and-information-technology.html\">OTH Regensburg</a>, Faculty of Electrical Engineering and Information Technology.
</p>
<div>
<img src=\"modelica://FluxTubesExtension/Resources/Images/ESheetI.png\" alt=\"Approximated magnetization characteristics of Electro-Sheet I\"><br>
<img src=\"modelica://FluxTubesExtension/Resources/Images/ESheetIV.png\" alt=\"Approximated magnetization characteristics of Electro-Sheet IV\"><br>
<img src=\"modelica://FluxTubesExtension/Resources/Images/CastSteel.png\" alt=\"Approximated magnetization characteristics of Cast Steel\"><br>
<img src=\"modelica://FluxTubesExtension/Resources/Images/RolledSteel.png\" alt=\"Approximated magnetization characteristics of Rolled Steel\"><br>
<img src=\"modelica://FluxTubesExtension/Resources/Images/CastIron.png\" alt=\"Approximated magnetization characteristics of Cast Iron\"><br>
</div>
<p>
The following materials (electro-sheet hot rolled and cold rolled) were used for eductaion at the 
<a href=\"https://www.tuwien.at/en/tu-wien\">Technical University Vienna</a>, Institute of Energy Systems and Electrical Drives.
</p>
<div>
<img src=\"modelica://FluxTubesExtension/Resources/Images/HotRolled.png\" alt=\"Approximated magnetization characteristics of Hot rolled sheets\"><br>
<img src=\"modelica://FluxTubesExtension/Resources/Images/ColdRolled.png\" alt=\"Approximated magnetization characteristics of Cold rolled sheets\">
</div>
<p>
Note that the magnetisation characteristics largely depend on possible previous machining and on measurement conditions. 
A virgin material normally has a considerably higher permeability than the same material after machining (and packet assembling in case of electric sheets). 
</p>
<p>
Additional user-specific materials can be defined as needed. This requires determination of the approximation parameters from the original data points, preferably with a nonlinear curve fit.
</p>
</html>"));
end SimpleSoftMagnetic;
