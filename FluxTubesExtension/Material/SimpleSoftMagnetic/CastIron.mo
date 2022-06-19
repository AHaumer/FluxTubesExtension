within FluxTubesExtension.Material.SimpleSoftMagnetic;
record CastIron "Cast Iron"
  extends BaseData(
    label="Cast Iron",
    N=4,
    Hk={284.5260788, 307.5374406, 480.0887267, 10632.08188},
    Bk={14.31098156, -18.10332415, 4.29387392, 0.794003619});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end CastIron;
