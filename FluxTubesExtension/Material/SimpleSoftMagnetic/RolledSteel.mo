within FluxTubesExtension.Material.SimpleSoftMagnetic;
record RolledSteel "Rolled Steel"
  extends BaseData(
    label="Rolled Steel",
    N=4,
    Hk={42.96654177, 142.6231573, 1007.512899, 22867.60172},
    Bk={0.064180337, 0.011133998, 1.3590329, 0.853999161});

  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end RolledSteel;
