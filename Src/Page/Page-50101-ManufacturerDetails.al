page 50101 "Manufacturer Details"
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
                }
                field("Brand Name"; Rec."Brand Name")
                {
                    Caption = 'Manufacturer Name';
                }
                field(Location; Rec.Location)
                {
                    TableRelation = Location;
                }
            }
        }
    }

    actions
    {
    }
}

