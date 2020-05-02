with Reactor; use Reactor;
with Ada.Text_IO; use Ada.Text_IO;
package body Train with SPARK_Mode
is

   procedure addCarriage is
   begin
      currentCarriages := currentCarriages+1;
   end addCarriage;

   procedure removeCarriage is
   begin
      currentCarriages := currentCarriages-1;
   end removeCarriage;

   procedure increaseSpeed is
   begin
      currentSpeed := currentElectricityProduced*2;
   end increaseSpeed;

   procedure decreaseSpeed is
   begin
      if currentSpeed > 1 then
         currentSpeed := currentSpeed - currentCarriages;
      end if;
   end decreaseSpeed;
end Train;
