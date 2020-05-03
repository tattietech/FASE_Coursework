with Reactor; use Reactor;
package Train with SPARK_Mode
is
   subtype Carriage is Integer range 1..19;
   subtype Speed is Integer range 0..200;

   currentCarriages : Carriage := Carriage'First;
   currentSpeed : Speed := Speed'First;
   currentMaxSpeed : Speed := Speed'Last;

   function TrainStopped return Boolean is
      (currentSpeed = 0);

   procedure addCarriage with
     Global => (In_Out => (currentCarriages, currentMaxSpeed), Proof_In => currentSpeed),
     Pre => currentCarriages < 19 and TrainStopped,
     Post => currentCarriages > currentCarriages-1 and TrainStopped;

   procedure removeCarriage with
     Global => (In_Out => (currentCarriages, currentMaxSpeed), Proof_In => currentSpeed),
     Pre => currentCarriages > 1 and TrainStopped,
     Post => currentCarriages < currentCarriages+1 and TrainStopped;

   procedure increaseSpeed with
     Global => (In_out => currentSpeed, Input => (currentElectricityProduced, currentMaxSpeed)),
     Pre => currentSpeed < Speed'Last,
     Post => currentSpeed >= currentSpeed-2;

end Train;
