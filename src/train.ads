package Train with SPARK_Mode
is
   subtype Carriage is Integer range 1..20;
   subtype Speed is Integer range 0..500;

   currentCarriages : Carriage := Carriage'First;
   currentSpeed : Speed := Speed'First;

   function TrainStopped return Boolean is
      (currentSpeed = 0);

   procedure addCarriage with
     Global => (In_Out => currentCarriages, Proof_In => currentSpeed),
     Pre => currentCarriages < 20 and TrainStopped,
     Post => currentCarriages > currentCarriages-1 and TrainStopped;

   procedure removeCarriage with
     Global => (In_Out => currentCarriages, Proof_In => currentSpeed),
     Pre => currentCarriages > 1 and TrainStopped,
     Post => currentCarriages < currentCarriages+1 and TrainStopped;

end Train;
