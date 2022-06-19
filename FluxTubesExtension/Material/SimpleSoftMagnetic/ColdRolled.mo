within FluxTubesExtension.Material.SimpleSoftMagnetic;
record ColdRolled "Cold rolled"
  extends BaseData(
    label="Cold rolled",
    N=4,
    Hk={13.28445954, 80.09899298, 855.1485033, 4564.514748},
    Bk={1.391367981, 0.233814626, 0.147973206, 0.205661306});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end ColdRolled;
