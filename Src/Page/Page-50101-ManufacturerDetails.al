page 50119 "Manufacturer Details"
{
    Caption = 'Manufacturer Details';
    PageType = List;
    SourceTable = Brand;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Brand Type"; Rec."Brand Type")
                {
                    Caption = 'Item Code';
                    TableRelation = Item;
                    ApplicationArea = All;
                }
                field("Brand Name"; Rec."Brand Name")
                {
                    ApplicationArea = All;
                    Caption = 'Manufacturer Name';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                    TableRelation = Location;
                }
            }
        }
    }

    actions
    {
    }
}

