with Reactor; use Reactor;
with Train; use Train;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Str : String (1..2);
   Last : Natural;

   task EntryGuard;
   task Heat;
   task Power;
   task Water;

  task body EntryGuard is
   begin
      loop
         Put_Line("Enter what you want to do:");
         Get_Line(Str,Last);
         case Str(1) is
         when '1' => addControlRod;
         when '2' => removeControlRod;
         when '3' => fillWaterSupply;
         when others => abort Heat; exit;
         end case;
      end loop;
      delay 0.1;
   end EntryGuard;

  task body Heat is
   begin
      loop
         increaseTemperature(InputConst);
         decreaseTemperature(InputConst);
         Put_Line("Rods: " & Integer'Image(currentRods) & " Water: " & Integer'Image(currentWaterSupply) & " Temp: " & Integer'Image(currentTemperature) & " Power " & Integer'Image(currentElectricityProduced));
         delay 1.0;
      end loop;
   end Heat;

   task body Water is
   begin
      loop
         decreaseWaterSupply;
         delay 1.0;
      end loop;
   end Water;

   task body Power is
   begin
      loop
         increaseElectricity(InputConst);
         delay 1.0;
      end loop;
   end Power;



begin
   --  Insert code here.
   null;
end Main;
