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
end Train;
