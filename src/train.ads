package Train with SPARK_Mode
is
   type Carriage is range 1..20;
   type Speed is range 0..500;
   type Status is (Start, Stop);

   currentCarriages : Carriage := Carriage'First;
   currentSpeed : Speed := Speed'First;
end Train;
