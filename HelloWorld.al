// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!
// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50135 PPOExt extends "Planned Production Orders"
{

    layout
    {
        addafter("No.")
        {
            field(ItemPart; SmartField(Rec))
            {
                Caption = 'Part Number';
                ApplicationArea = All;

            }
        }
    }
    procedure SmartField(Header: Record "Production Order"): Text

    var
        SL: Record "Prod. Order Line";
        ItemPart: Text;
    begin
        //Message('App published: Hello world');
        //  SL.SETRANGE("Source Type", Header."Source Type");
        // SL.SETRANGE("Document No.", Header."No.");
        // SL.SETRANGE("Type", SL.Type::Item);
        IF SL.FindSet() Then
            repeat
                if
                   ItemPart <> '' then
                    ItemPart += ' | ' + SL."Item No."

                else
                    ItemPart := SL."Item No."
               until
               SL.Next() = 0;


        EXIT(ItemPart);

        //exit('Smarter' + PurchaseHeader."No.");
    end;
}