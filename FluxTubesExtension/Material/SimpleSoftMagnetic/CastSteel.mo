within FluxTubesExtension.Material.SimpleSoftMagnetic;
record CastSteel "Cast Steel"
  extends BaseData(
    label="Cast Steel",
    N=4,
    Hk={42.96645568, 126.4229812, 607.0372946, 22587.35291},
    Bk={0.590730498, 0.274882065, 0.698166955, 0.64234516});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end CastSteel;
