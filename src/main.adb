with Reactor; use Reactor;
with Train; use Train;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Str : String (1..2);
   Last : Natural;

   task EntryGuard;
   task Display;
   task Heat;
   task Power;
   task Water;
   task Speed;

  task body EntryGuard is
   begin
      loop
         Put_Line("Enter what you want to do:");
         Get_Line(Str,Last);
         case Str(1) is
         when '1' => addControlRod;
         when '2' => removeControlRod;
         when '3' => fillWaterSupply;
         when '4' => addCarriage;
         when '5' => removeCarriage;
         when '6' => stopReactor;
         when '7' => startReactor;
         when others => abort Heat; abort Power; abort Water; abort Speed; exit;
         end case;
      end loop;
      delay 0.1;
   end EntryGuard;

   task body Display is
   begin
      loop
           Put_Line("Power Status : " & Boolean'Image(ReactorOn) & " | Rods: " & Integer'Image(currentRods) & " | Water: " & Integer'Image(currentWaterSupply) & " | Temp: " & Integer'Image(currentTemperature) & " | Power " & Integer'Image(currentElectricityProduced)
                  & " | Speed: " & Integer'Image(currentSpeed) & " | Carriages " & Integer'Image(currentCarriages)
                   );
       delay 1.0;
      end loop;
   end Display;

    task body Heat is
     begin
        loop
           increaseTemperature(InputConst);
           decreaseTemperature(InputConst);
           if currentTemperature = Temperature'Last then
              stopReactor;
              currentTemperature := Temperature'Last-1;
              Put_Line("Reactor over heating, shutting down...");
           end if;
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

     task body Speed is
   begin
      loop
         increaseSpeed;
         --decreaseSpeed;
         delay 1.0;
      end loop;
   end Speed;



begin
   --  Insert code here.
   null;
end Main;
