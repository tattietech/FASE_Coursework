package body Reactor with SPARK_mode
is
   procedure RemoveControlRod is
   begin
      currentRods := currentRods-1;
   end RemoveControlRod;

   procedure AddControlRod is
   begin
      currentRods := currentRods+1;
   end AddControlRod;
end Reactor;
