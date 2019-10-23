with integer_list;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Command_Line;

procedure Text_List is

package ASU renames Ada.Strings.Unbounded;
package ACL renames Ada.Command_Line;


Usage_Error: exception;

procedure Read_Arguments is

begin
	if ACL.Argument_Count /= 2 then
		raise Usage_Error;
	end if;
end Read_Arguments;

procedure Add_Manual ( List: in out Integer_List.Integer_List_Type) is 
winner: boolean;
begin
	Integer_List.Add_Number(List, 5, winner);
	Ada.Text_IO.Put_Line("WINNER: " & Boolean'Image(winner));
	Integer_List.Add_Number(List, 22, winner);
	Integer_List.Add_Number(List, 6, winner);
	Ada.Text_IO.Put_Line("Lista:"); 
	Integer_List.Print_List(List);
	Ada.Text_IO.Put_Line("WINNER: " & Boolean'Image(winner));

end Add_Manual;

Integer_l: Integer_List.Integer_List_Type;
User_Input: ASU.Unbounded_String;
Numer: ASU.Unbounded_String;
Num: ASU.Unbounded_String;
Number: Integer;
Num1: Integer;
Num2:Integer;
winner: boolean;
Finish: Boolean;

begin
	--Read_Arguments;
	Finish := True;
	--Add_Manual(Integer_l);
	Read_Arguments;
	Numer := ASU.To_Unbounded_String(ACL.Argument(1));
	Num1 := Integer'Value(ASU.To_String(Numer));
	Integer_List.Add_Number(Integer_l, Num1, Winner);
	Num := ASU.To_Unbounded_String(ACL.Argument(2));
	Num2 := Integer'Value(ASU.To_String(Num));
	Integer_List.Add_Number(Integer_l, Num2, Winner);
	loop
		User_Input := ASU.To_Unbounded_String(Ada.Text_IO.Get_Line);
		begin	
			Number := Integer'Value(ASU.To_String(User_Input));
			Ada.Text_IO.Put_Line("Read");
			Integer_List.Add_Number(Integer_l, Number, Winner);
			Integer_List.Suma_Numbers (Integer_l);
			ADA.Text_IO.New_Line(1);

		exception 
			when Constraint_Error => 
			if ASU.To_String(User_Input) = ".exit" then 
				Finish := False;
			else
				Ada.Text_IO.Put_Line("IT IS NOT A NUMBER");
			end if;		
		end;
		exit when not Finish;
	end loop;
	Ada.Text_IO.Put_Line("Haciendose la lista");
	Integer_List.Print_List(Integer_l);
	Integer_List.Save_File(Integer_l);
	--Ada.Text_IO.Put_Line("Add manual");
	--Add_Manual(Integer_l);

exception
	when Integer_List.Seven_Not_Allowed =>
			Ada.Text_IO.Put_Line("You can not add number 7 to the list");
	when Usage_Error => Ada.Text_IO.Put_Line("Usage error: ./test_list arg1 arg2 ");

end Text_List;
