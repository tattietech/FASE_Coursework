with Reactor; use Reactor;
with Ada.Text_IO; use Ada.Text_IO;
package body Train with SPARK_Mode
is

   procedure addCarriage is
   begin
      if currentSpeed = 0 then
         currentCarriages := currentCarriages+1;
         if currentMaxSpeed >=Speed'First+10 then
            currentMaxSpeed := currentMaxSpeed-10;
         end if;
      end if;
   end addCarriage;

   procedure removeCarriage is
   begin
      if currentSpeed = 0 then
         currentCarriages := currentCarriages-1;
         if currentMaxSpeed <=Speed'Last-10 then
            currentMaxSpeed := currentMaxSpeed+10;
         end if;
      end if;
   end removeCarriage;

   procedure increaseSpeed is
   begin
      if currentElectricityProduced > currentMaxSpeed then
         currentSpeed := currentMaxSpeed;
      else
         currentSpeed := currentElectricityProduced;
      end if;
   end increaseSpeed;

   procedure decreaseSpeed is
   begin
      if currentSpeed >= 5 then
         currentSpeed := currentSpeed-5;
      else
         currentSpeed := 0;
      end if;
   end decreaseSpeed;
end Train;
