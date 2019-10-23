--Interfaz publica

package Integer_List is

Seven_Not_Allowed: exception;

type cell; 		--declaramos un tipo de manera imcompleta para que compile.

type Integer_List_Type is access cell; 	-- con poner access Integer_Record vale
type cell is record
	Number: Integer;
	Next: Integer_List_type;
end record;

procedure Add_Number(Integer_list: in out Integer_List_type;
		     Number: in Integer; Winner: out Boolean);  
-- in out es para listas de entrada y salida, puedes añadir numeros y puede devolver parametros por ejemplo para verificar.
-- es algo que entra a la funcion y no cambia dentro de la funcion.
-- in out es para cuando nos importa lo que entra y puede cambiar para salir.
-- out es cuando no nos importa lo que entra, solo nos importa lo que cambia.
procedure Print_List (Integer_list: in Integer_List_Type);

procedure Save_File (Integer_list: in Integer_List_Type);

procedure Suma_Numbers (List: Integer_List_Type);

end Integer_List; 
