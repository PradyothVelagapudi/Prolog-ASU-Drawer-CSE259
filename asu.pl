/*CSE 259 Project 1*/
/*Pradyoth Velagapudi*/
/*Professor Osburn*/
/*12 March 2023*/
/*Check ReadMe for project description*/

/*draw horizontal line*/
drawHLine(N) :- 
	( N =:= 0, write('\n') ); /*base case: newline*/
	(
		N>0,
		write('-'), /*recursive case: draw as many dashes as input number*/
		drawHLine(N-1)
	).

/*add vertical margin at top and bottom*/
leaveTBMargin(N, W) :-
	( N =< 0 ); /*base case: do nothing*/
	(
		N>0,
		write('|'),
		widthSpaces(W), /*recursive case: add spaces bounded by vert lines for the tob&bottom margins*/
		write('|\n'),
		leaveTBMargin(N-1, W)
	).
/*helper predicate to place proper number of spaces to fill top and bottom margins*/
widthSpaces(W) :-
	( W =:= 0, !); /*base case: do nothing*/
	(
		W>0,
		write(' '), /*recursive case: add as many spaces as input number*/
		widthSpaces(W-1)
	).

/*draw letters top to bottom one "block" at a time*/
drawLetters(LRMargin, Space, FSize) :-
	drawFirstLine(LRMargin, Space, FSize, FSize), 
	drawSecondLine(LRMargin, Space, FSize, FSize),
	drawThirdLine(LRMargin, Space, FSize, FSize),
	drawFourthLine(LRMargin, Space, FSize, FSize),
	drawFifthLine(LRMargin, Space, FSize, FSize).
/*helper predicates to draw letters one "block" at a time with vertical lines and LR Margins*/
drawFirstLine(LRMargin, Space, FSize, F) :-
	( F =:= 0 ); /*base case*/
	(
		F>0, /*recursive case: repeat as many times as font size specifies*/
		write('|'), 
		widthSpaces(LRMargin), %LeftMargin
		writeStar(FSize), %A
		writeStar(FSize), %A
		writeStar(FSize), %A
		widthSpaces(Space), %Space
		writeStar(FSize), %S 
		writeStar(FSize), %S 
		writeStar(FSize), %S 
		widthSpaces(Space), %Space 
		writeStar(FSize), %U 
		widthSpaces(FSize), %U 
		writeStar(FSize), %U 
		widthSpaces(LRMargin), %RightMargin
		write('|\n'),
		drawFirstLine(LRMargin, Space, FSize, F-1) 
	).
drawSecondLine(LRMargin, Space, FSize, F) :-
	( F =:= 0 ); /*base case*/
	(
		F>0, /*recursive case: repeat as many times as font size specifies*/
		write('|'),
		widthSpaces(LRMargin), %LeftMargin 
		writeStar(FSize), %A 
		widthSpaces(FSize), %A 
		writeStar(FSize), %A 
		widthSpaces(Space), %Space 
		writeStar(FSize), %S 
		widthSpaces(FSize), %S 
		widthSpaces(FSize), %S 
		widthSpaces(Space), %Space 
		writeStar(FSize), %U 
		widthSpaces(FSize), %U 
		writeStar(FSize), %U 
		widthSpaces(LRMargin), %RightMargin 
		write('|\n'),
		drawSecondLine(LRMargin, Space, FSize, F-1)
	).
drawThirdLine(LRMargin, Space, FSize, F) :-
	( F =:= 0 ); /*base case*/
	(
		F>0, /*recursive case: repeat as many times as font size specifies*/
		write('|'),
		widthSpaces(LRMargin), %LeftMargin
		writeStar(FSize), %A
		writeStar(FSize), %A 
		writeStar(FSize), %A 
		widthSpaces(Space), %Space 
		writeStar(FSize), %S 
		writeStar(FSize), %S 
		writeStar(FSize), %S 
		widthSpaces(Space), %Space 
		writeStar(FSize), %U 
		widthSpaces(FSize), %U 
		writeStar(FSize), %U 
		widthSpaces(LRMargin), %RightMargin
		write('|\n'), 
		drawThirdLine(LRMargin, Space, FSize, F-1)
	).
drawFourthLine(LRMargin, Space, FSize, F) :-
	( F =:= 0 ); /*base case*/
	(
		F>0, /*recursive case:  repeat as many times as font size specifies*/
		write('|'),
		widthSpaces(LRMargin), %LeftMargin
		writeStar(FSize),%A
		widthSpaces(FSize),%A
		writeStar(FSize),%A
		widthSpaces(Space),%Space 
		widthSpaces(FSize),%S 
		widthSpaces(FSize),%S 
		writeStar(FSize),%S 
		widthSpaces(Space),%Space
		writeStar(FSize),%U
		widthSpaces(FSize),%U
		writeStar(FSize),%U
		widthSpaces(LRMargin),%RightMargin
		write('|\n'),
		drawFourthLine(LRMargin, Space, FSize, F-1)
	).
drawFifthLine(LRMargin, Space, FSize, F) :-
	( F =:= 0 );
	(
		F>0,
		write('|'),
		widthSpaces(LRMargin),%LeftMargin
		writeStar(FSize),%A
		widthSpaces(FSize),%A
		writeStar(FSize),%A
		widthSpaces(Space),%Space
		writeStar(FSize),%S 
		writeStar(FSize),%S 
		writeStar(FSize),%S 
		widthSpaces(Space),%Space
		writeStar(FSize),%U
		writeStar(FSize),%U
		writeStar(FSize),%U
		widthSpaces(LRMargin),%RightMargin
		write('|\n'),
		drawFifthLine(LRMargin, Space, FSize, F-1)
	).
/*helper predicate to write as many *s as input number*/
writeStar(N) :-
	( N =:= 0, ! ); /*base case: do nothing*/
	(
		N>0,
		write('*'), /*recursive case: write * as many times as input number*/
		writeStar(N-1)
	).

/*asu predicate*/
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :- 
	integer(LeftRightMargin), integer(BottomTopMargin), integer(SpaceBetweenCharacters), integer(FontSize), /*all inputs must be integers*/
	LeftRightMargin>=0, BottomTopMargin>=0, SpaceBetweenCharacters>=0, FontSize>=0, /*all inputs must be non-negative*/
	WidthOfHLine is 2+(2*LeftRightMargin)+(2*SpaceBetweenCharacters)+(9*FontSize), /*calculate width of horizontal lines*/
	((WidthOfHLine>2, /*in case width of Hline is greater than 0*/
		drawHLine(WidthOfHLine), /*draw top line*/
		InteriorWidth is WidthOfHLine-2, /*calculate width minus 2 for the vertical side borders*/
		leaveTBMargin(BottomTopMargin, InteriorWidth), /*leave top margin*/ 
		drawLetters(LeftRightMargin, SpaceBetweenCharacters, FontSize), /*draw interior letters with bordering margins and lines*/ 
		leaveTBMargin(BottomTopMargin, InteriorWidth), /*leave bottom margin*/ 
		drawHLine(WidthOfHLine) /*draw bottom line*/ ) ;
	(WidthOfHLine=:=2, /*in case width of Hline is 0*/
		drawHLine(0), /*draw top line*/
		InteriorWidth is WidthOfHLine-2, /*calculate width minus 2 for the vertical side borders*/
		leaveTBMargin(BottomTopMargin, InteriorWidth), /*leave top margin*/ 
		drawLetters(LeftRightMargin, SpaceBetweenCharacters, FontSize), /*draw interior letters with bordering margins and lines*/ 
		leaveTBMargin(BottomTopMargin, InteriorWidth), /*leave bottom margin*/ 
		drawHLine(0) /*draw bottom line*/ )).
