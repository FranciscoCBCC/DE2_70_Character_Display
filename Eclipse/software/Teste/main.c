/* function prototypes */
void VGA_text (int, int, char *);

/********************************************************************************
 * This program demonstrates use of the char buffer. It places a text string
 * near the middle of the screen, in white.
********************************************************************************/
int main(void)
{
	/* create a message to be displayed on the VGA display */
	char text_top_row[40] = "Altera DE2\0";
	char text_bottom_row[40] = "Char Buffer\0";

	/* output text message near the middle of the VGA monitor */
	VGA_text (35, 29, text_top_row);
	VGA_text (35, 30, text_bottom_row);
}

/****************************************************************************************
 * Subroutine to send a string of text to the VGA monitor
****************************************************************************************/
void VGA_text(int x, int y, char * text_ptr)
{
	int offset;
	/* Declare volatile pointer to char buffer (volatile means that IO load
	   and store instructions will be used to access these pointer locations,
	   instead of regular memory loads and stores) */
  	volatile char * character_buffer = (char *) 0x00008000;	// VGA character buffer

	/* assume that the text string fits on one line */
	offset = (y << 7) + x;
	while ( *(text_ptr) )
	{
		*(character_buffer + offset) = *(text_ptr);	// write to the character buffer
		++text_ptr;
		++offset;
	}
}
