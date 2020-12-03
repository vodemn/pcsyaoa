LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY std;
USE std.textio.ALL;

PACKAGE utils_package IS
    CONSTANT clk_period : TIME := 20 ns;

    FUNCTION to_string (element : INTEGER) RETURN STRING;

    FUNCTION fix_int (number : INTEGER) RETURN INTEGER;

END PACKAGE utils_package;

PACKAGE BODY utils_package IS
    FUNCTION fix_int (number : INTEGER) RETURN INTEGER IS
        VARIABLE result : INTEGER;
    BEGIN
        IF (number < 0) THEN
            result := 0;
        ELSE
            result := number;
        END IF;
        RETURN result;
    END FUNCTION fix_int;

    FUNCTION to_string (element : INTEGER) RETURN STRING IS
        VARIABLE str : STRING(1 TO 4);
    BEGIN
        CASE element IS
            WHEN 0 => str := "   0";
            WHEN 1 => str := "   1";
            WHEN 2 => str := "   2";
            WHEN 3 => str := "   3";
            WHEN 4 => str := "   4";
            WHEN 5 => str := "   5";
            WHEN 6 => str := "   6";
            WHEN 7 => str := "   7";
            WHEN 8 => str := "   8";
            WHEN 9 => str := "   9";
            WHEN 10 => str := "  10";
            WHEN 11 => str := "  11";
            WHEN 12 => str := "  12";
            WHEN 13 => str := "  13";
            WHEN 14 => str := "  14";
            WHEN 15 => str := "  15";
            WHEN 16 => str := "  16";
            WHEN 17 => str := "  17";
            WHEN 18 => str := "  18";
            WHEN 19 => str := "  19";
            WHEN 20 => str := "  20";
            WHEN 21 => str := "  21";
            WHEN 22 => str := "  22";
            WHEN 23 => str := "  23";
            WHEN 24 => str := "  24";
            WHEN 25 => str := "  25";
            WHEN 26 => str := "  26";
            WHEN 27 => str := "  27";
            WHEN 28 => str := "  28";
            WHEN 29 => str := "  29";
            WHEN 30 => str := "  30";
            WHEN 31 => str := "  31";
            WHEN 32 => str := "  32";
            WHEN 33 => str := "  33";
            WHEN 34 => str := "  34";
            WHEN 35 => str := "  35";
            WHEN 36 => str := "  36";
            WHEN 37 => str := "  37";
            WHEN 38 => str := "  38";
            WHEN 39 => str := "  39";
            WHEN 40 => str := "  40";
            WHEN 41 => str := "  41";
            WHEN 42 => str := "  42";
            WHEN 43 => str := "  43";
            WHEN 44 => str := "  44";
            WHEN 45 => str := "  45";
            WHEN 46 => str := "  46";
            WHEN 47 => str := "  47";
            WHEN 48 => str := "  48";
            WHEN 49 => str := "  49";
            WHEN 50 => str := "  50";
            WHEN 51 => str := "  51";
            WHEN 52 => str := "  52";
            WHEN 53 => str := "  53";
            WHEN 54 => str := "  54";
            WHEN 55 => str := "  55";
            WHEN 56 => str := "  56";
            WHEN 57 => str := "  57";
            WHEN 58 => str := "  58";
            WHEN 59 => str := "  59";
            WHEN 60 => str := "  60";
            WHEN 61 => str := "  61";
            WHEN 62 => str := "  62";
            WHEN 63 => str := "  63";
            WHEN 64 => str := "  64";
            WHEN 65 => str := "  65";
            WHEN 66 => str := "  66";
            WHEN 67 => str := "  67";
            WHEN 68 => str := "  68";
            WHEN 69 => str := "  69";
            WHEN 70 => str := "  70";
            WHEN 71 => str := "  71";
            WHEN 72 => str := "  72";
            WHEN 73 => str := "  73";
            WHEN 74 => str := "  74";
            WHEN 75 => str := "  75";
            WHEN 76 => str := "  76";
            WHEN 77 => str := "  77";
            WHEN 78 => str := "  78";
            WHEN 79 => str := "  79";
            WHEN 80 => str := "  80";
            WHEN 81 => str := "  81";
            WHEN 82 => str := "  82";
            WHEN 83 => str := "  83";
            WHEN 84 => str := "  84";
            WHEN 85 => str := "  85";
            WHEN 86 => str := "  86";
            WHEN 87 => str := "  87";
            WHEN 88 => str := "  88";
            WHEN 89 => str := "  89";
            WHEN 90 => str := "  90";
            WHEN 91 => str := "  91";
            WHEN 92 => str := "  92";
            WHEN 93 => str := "  93";
            WHEN 94 => str := "  94";
            WHEN 95 => str := "  95";
            WHEN 96 => str := "  96";
            WHEN 97 => str := "  97";
            WHEN 98 => str := "  98";
            WHEN 99 => str := "  99";
            WHEN 100 => str := " 100";
            WHEN 101 => str := " 101";
            WHEN 102 => str := " 102";
            WHEN 103 => str := " 103";
            WHEN 104 => str := " 104";
            WHEN 105 => str := " 105";
            WHEN 106 => str := " 106";
            WHEN 107 => str := " 107";
            WHEN 108 => str := " 108";
            WHEN 109 => str := " 109";
            WHEN 110 => str := " 110";
            WHEN 111 => str := " 111";
            WHEN 112 => str := " 112";
            WHEN 113 => str := " 113";
            WHEN 114 => str := " 114";
            WHEN 115 => str := " 115";
            WHEN 116 => str := " 116";
            WHEN 117 => str := " 117";
            WHEN 118 => str := " 118";
            WHEN 119 => str := " 119";
            WHEN 120 => str := " 120";
            WHEN 121 => str := " 121";
            WHEN 122 => str := " 122";
            WHEN 123 => str := " 123";
            WHEN 124 => str := " 124";
            WHEN 125 => str := " 125";
            WHEN 126 => str := " 126";
            WHEN 127 => str := " 127";
            WHEN 128 => str := " 128";
            WHEN 129 => str := " 129";
            WHEN 130 => str := " 130";
            WHEN 131 => str := " 131";
            WHEN 132 => str := " 132";
            WHEN 133 => str := " 133";
            WHEN 134 => str := " 134";
            WHEN 135 => str := " 135";
            WHEN 136 => str := " 136";
            WHEN 137 => str := " 137";
            WHEN 138 => str := " 138";
            WHEN 139 => str := " 139";
            WHEN 140 => str := " 140";
            WHEN 141 => str := " 141";
            WHEN 142 => str := " 142";
            WHEN 143 => str := " 143";
            WHEN 144 => str := " 144";
            WHEN 145 => str := " 145";
            WHEN 146 => str := " 146";
            WHEN 147 => str := " 147";
            WHEN 148 => str := " 148";
            WHEN 149 => str := " 149";
            WHEN 150 => str := " 150";
            WHEN 151 => str := " 151";
            WHEN 152 => str := " 152";
            WHEN 153 => str := " 153";
            WHEN 154 => str := " 154";
            WHEN 155 => str := " 155";
            WHEN 156 => str := " 156";
            WHEN 157 => str := " 157";
            WHEN 158 => str := " 158";
            WHEN 159 => str := " 159";
            WHEN 160 => str := " 160";
            WHEN 161 => str := " 161";
            WHEN 162 => str := " 162";
            WHEN 163 => str := " 163";
            WHEN 164 => str := " 164";
            WHEN 165 => str := " 165";
            WHEN 166 => str := " 166";
            WHEN 167 => str := " 167";
            WHEN 168 => str := " 168";
            WHEN 169 => str := " 169";
            WHEN 170 => str := " 170";
            WHEN 171 => str := " 171";
            WHEN 172 => str := " 172";
            WHEN 173 => str := " 173";
            WHEN 174 => str := " 174";
            WHEN 175 => str := " 175";
            WHEN 176 => str := " 176";
            WHEN 177 => str := " 177";
            WHEN 178 => str := " 178";
            WHEN 179 => str := " 179";
            WHEN 180 => str := " 180";
            WHEN 181 => str := " 181";
            WHEN 182 => str := " 182";
            WHEN 183 => str := " 183";
            WHEN 184 => str := " 184";
            WHEN 185 => str := " 185";
            WHEN 186 => str := " 186";
            WHEN 187 => str := " 187";
            WHEN 188 => str := " 188";
            WHEN 189 => str := " 189";
            WHEN 190 => str := " 190";
            WHEN 191 => str := " 191";
            WHEN 192 => str := " 192";
            WHEN 193 => str := " 193";
            WHEN 194 => str := " 194";
            WHEN 195 => str := " 195";
            WHEN 196 => str := " 196";
            WHEN 197 => str := " 197";
            WHEN 198 => str := " 198";
            WHEN 199 => str := " 199";
            WHEN 200 => str := " 200";
            WHEN 201 => str := " 201";
            WHEN 202 => str := " 202";
            WHEN 203 => str := " 203";
            WHEN 204 => str := " 204";
            WHEN 205 => str := " 205";
            WHEN 206 => str := " 206";
            WHEN 207 => str := " 207";
            WHEN 208 => str := " 208";
            WHEN 209 => str := " 209";
            WHEN 210 => str := " 210";
            WHEN 211 => str := " 211";
            WHEN 212 => str := " 212";
            WHEN 213 => str := " 213";
            WHEN 214 => str := " 214";
            WHEN 215 => str := " 215";
            WHEN 216 => str := " 216";
            WHEN 217 => str := " 217";
            WHEN 218 => str := " 218";
            WHEN 219 => str := " 219";
            WHEN 220 => str := " 220";
            WHEN 221 => str := " 221";
            WHEN 222 => str := " 222";
            WHEN 223 => str := " 223";
            WHEN 224 => str := " 224";
            WHEN 225 => str := " 225";
            WHEN 226 => str := " 226";
            WHEN 227 => str := " 227";
            WHEN 228 => str := " 228";
            WHEN 229 => str := " 229";
            WHEN 230 => str := " 230";
            WHEN 231 => str := " 231";
            WHEN 232 => str := " 232";
            WHEN 233 => str := " 233";
            WHEN 234 => str := " 234";
            WHEN 235 => str := " 235";
            WHEN 236 => str := " 236";
            WHEN 237 => str := " 237";
            WHEN 238 => str := " 238";
            WHEN 239 => str := " 239";
            WHEN 240 => str := " 240";
            WHEN 241 => str := " 241";
            WHEN 242 => str := " 242";
            WHEN 243 => str := " 243";
            WHEN 244 => str := " 244";
            WHEN 245 => str := " 245";
            WHEN 246 => str := " 246";
            WHEN 247 => str := " 247";
            WHEN 248 => str := " 248";
            WHEN 249 => str := " 249";
            WHEN 250 => str := " 250";
            WHEN 251 => str := " 251";
            WHEN 252 => str := " 252";
            WHEN 253 => str := " 253";
            WHEN 254 => str := " 254";
            WHEN 255 => str := " 255";
            WHEN 256 => str := " 256";
            WHEN 257 => str := " 257";
            WHEN 258 => str := " 258";
            WHEN 259 => str := " 259";
            WHEN 260 => str := " 260";
            WHEN 261 => str := " 261";
            WHEN 262 => str := " 262";
            WHEN 263 => str := " 263";
            WHEN 264 => str := " 264";
            WHEN 265 => str := " 265";
            WHEN 266 => str := " 266";
            WHEN 267 => str := " 267";
            WHEN 268 => str := " 268";
            WHEN 269 => str := " 269";
            WHEN 270 => str := " 270";
            WHEN 271 => str := " 271";
            WHEN 272 => str := " 272";
            WHEN 273 => str := " 273";
            WHEN 274 => str := " 274";
            WHEN 275 => str := " 275";
            WHEN 276 => str := " 276";
            WHEN 277 => str := " 277";
            WHEN 278 => str := " 278";
            WHEN 279 => str := " 279";
            WHEN 280 => str := " 280";
            WHEN 281 => str := " 281";
            WHEN 282 => str := " 282";
            WHEN 283 => str := " 283";
            WHEN 284 => str := " 284";
            WHEN 285 => str := " 285";
            WHEN 286 => str := " 286";
            WHEN 287 => str := " 287";
            WHEN 288 => str := " 288";
            WHEN 289 => str := " 289";
            WHEN 290 => str := " 290";
            WHEN 291 => str := " 291";
            WHEN 292 => str := " 292";
            WHEN 293 => str := " 293";
            WHEN 294 => str := " 294";
            WHEN 295 => str := " 295";
            WHEN 296 => str := " 296";
            WHEN 297 => str := " 297";
            WHEN 298 => str := " 298";
            WHEN 299 => str := " 299";
            WHEN 300 => str := " 300";
            WHEN 301 => str := " 301";
            WHEN 302 => str := " 302";
            WHEN 303 => str := " 303";
            WHEN 304 => str := " 304";
            WHEN 305 => str := " 305";
            WHEN 306 => str := " 306";
            WHEN 307 => str := " 307";
            WHEN 308 => str := " 308";
            WHEN 309 => str := " 309";
            WHEN 310 => str := " 310";
            WHEN 311 => str := " 311";
            WHEN 312 => str := " 312";
            WHEN 313 => str := " 313";
            WHEN 314 => str := " 314";
            WHEN 315 => str := " 315";
            WHEN 316 => str := " 316";
            WHEN 317 => str := " 317";
            WHEN 318 => str := " 318";
            WHEN 319 => str := " 319";
            WHEN 320 => str := " 320";
            WHEN 321 => str := " 321";
            WHEN 322 => str := " 322";
            WHEN 323 => str := " 323";
            WHEN 324 => str := " 324";
            WHEN 325 => str := " 325";
            WHEN 326 => str := " 326";
            WHEN 327 => str := " 327";
            WHEN 328 => str := " 328";
            WHEN 329 => str := " 329";
            WHEN 330 => str := " 330";
            WHEN 331 => str := " 331";
            WHEN 332 => str := " 332";
            WHEN 333 => str := " 333";
            WHEN 334 => str := " 334";
            WHEN 335 => str := " 335";
            WHEN 336 => str := " 336";
            WHEN 337 => str := " 337";
            WHEN 338 => str := " 338";
            WHEN 339 => str := " 339";
            WHEN 340 => str := " 340";
            WHEN 341 => str := " 341";
            WHEN 342 => str := " 342";
            WHEN 343 => str := " 343";
            WHEN 344 => str := " 344";
            WHEN 345 => str := " 345";
            WHEN 346 => str := " 346";
            WHEN 347 => str := " 347";
            WHEN 348 => str := " 348";
            WHEN 349 => str := " 349";
            WHEN 350 => str := " 350";
            WHEN 351 => str := " 351";
            WHEN 352 => str := " 352";
            WHEN 353 => str := " 353";
            WHEN 354 => str := " 354";
            WHEN 355 => str := " 355";
            WHEN 356 => str := " 356";
            WHEN 357 => str := " 357";
            WHEN 358 => str := " 358";
            WHEN 359 => str := " 359";
            WHEN 360 => str := " 360";
            WHEN 361 => str := " 361";
            WHEN 362 => str := " 362";
            WHEN 363 => str := " 363";
            WHEN 364 => str := " 364";
            WHEN 365 => str := " 365";
            WHEN 366 => str := " 366";
            WHEN 367 => str := " 367";
            WHEN 368 => str := " 368";
            WHEN 369 => str := " 369";
            WHEN 370 => str := " 370";
            WHEN 371 => str := " 371";
            WHEN 372 => str := " 372";
            WHEN 373 => str := " 373";
            WHEN 374 => str := " 374";
            WHEN 375 => str := " 375";
            WHEN 376 => str := " 376";
            WHEN 377 => str := " 377";
            WHEN 378 => str := " 378";
            WHEN 379 => str := " 379";
            WHEN 380 => str := " 380";
            WHEN 381 => str := " 381";
            WHEN 382 => str := " 382";
            WHEN 383 => str := " 383";
            WHEN 384 => str := " 384";
            WHEN 385 => str := " 385";
            WHEN 386 => str := " 386";
            WHEN 387 => str := " 387";
            WHEN 388 => str := " 388";
            WHEN 389 => str := " 389";
            WHEN 390 => str := " 390";
            WHEN 391 => str := " 391";
            WHEN 392 => str := " 392";
            WHEN 393 => str := " 393";
            WHEN 394 => str := " 394";
            WHEN 395 => str := " 395";
            WHEN 396 => str := " 396";
            WHEN 397 => str := " 397";
            WHEN 398 => str := " 398";
            WHEN 399 => str := " 399";
            WHEN 400 => str := " 400";
            WHEN 401 => str := " 401";
            WHEN 402 => str := " 402";
            WHEN 403 => str := " 403";
            WHEN 404 => str := " 404";
            WHEN 405 => str := " 405";
            WHEN 406 => str := " 406";
            WHEN 407 => str := " 407";
            WHEN 408 => str := " 408";
            WHEN 409 => str := " 409";
            WHEN 410 => str := " 410";
            WHEN 411 => str := " 411";
            WHEN 412 => str := " 412";
            WHEN 413 => str := " 413";
            WHEN 414 => str := " 414";
            WHEN 415 => str := " 415";
            WHEN 416 => str := " 416";
            WHEN 417 => str := " 417";
            WHEN 418 => str := " 418";
            WHEN 419 => str := " 419";
            WHEN 420 => str := " 420";
            WHEN 421 => str := " 421";
            WHEN 422 => str := " 422";
            WHEN 423 => str := " 423";
            WHEN 424 => str := " 424";
            WHEN 425 => str := " 425";
            WHEN 426 => str := " 426";
            WHEN 427 => str := " 427";
            WHEN 428 => str := " 428";
            WHEN 429 => str := " 429";
            WHEN 430 => str := " 430";
            WHEN 431 => str := " 431";
            WHEN 432 => str := " 432";
            WHEN 433 => str := " 433";
            WHEN 434 => str := " 434";
            WHEN 435 => str := " 435";
            WHEN 436 => str := " 436";
            WHEN 437 => str := " 437";
            WHEN 438 => str := " 438";
            WHEN 439 => str := " 439";
            WHEN 440 => str := " 440";
            WHEN 441 => str := " 441";
            WHEN 442 => str := " 442";
            WHEN 443 => str := " 443";
            WHEN 444 => str := " 444";
            WHEN 445 => str := " 445";
            WHEN 446 => str := " 446";
            WHEN 447 => str := " 447";
            WHEN 448 => str := " 448";
            WHEN 449 => str := " 449";
            WHEN 450 => str := " 450";
            WHEN 451 => str := " 451";
            WHEN 452 => str := " 452";
            WHEN 453 => str := " 453";
            WHEN 454 => str := " 454";
            WHEN 455 => str := " 455";
            WHEN 456 => str := " 456";
            WHEN 457 => str := " 457";
            WHEN 458 => str := " 458";
            WHEN 459 => str := " 459";
            WHEN 460 => str := " 460";
            WHEN 461 => str := " 461";
            WHEN 462 => str := " 462";
            WHEN 463 => str := " 463";
            WHEN 464 => str := " 464";
            WHEN 465 => str := " 465";
            WHEN 466 => str := " 466";
            WHEN 467 => str := " 467";
            WHEN 468 => str := " 468";
            WHEN 469 => str := " 469";
            WHEN 470 => str := " 470";
            WHEN 471 => str := " 471";
            WHEN 472 => str := " 472";
            WHEN 473 => str := " 473";
            WHEN 474 => str := " 474";
            WHEN 475 => str := " 475";
            WHEN 476 => str := " 476";
            WHEN 477 => str := " 477";
            WHEN 478 => str := " 478";
            WHEN 479 => str := " 479";
            WHEN 480 => str := " 480";
            WHEN 481 => str := " 481";
            WHEN 482 => str := " 482";
            WHEN 483 => str := " 483";
            WHEN 484 => str := " 484";
            WHEN 485 => str := " 485";
            WHEN 486 => str := " 486";
            WHEN 487 => str := " 487";
            WHEN 488 => str := " 488";
            WHEN 489 => str := " 489";
            WHEN 490 => str := " 490";
            WHEN 491 => str := " 491";
            WHEN 492 => str := " 492";
            WHEN 493 => str := " 493";
            WHEN 494 => str := " 494";
            WHEN 495 => str := " 495";
            WHEN 496 => str := " 496";
            WHEN 497 => str := " 497";
            WHEN 498 => str := " 498";
            WHEN 499 => str := " 499";
            WHEN 500 => str := " 500";
            WHEN 501 => str := " 501";
            WHEN 502 => str := " 502";
            WHEN 503 => str := " 503";
            WHEN 504 => str := " 504";
            WHEN 505 => str := " 505";
            WHEN 506 => str := " 506";
            WHEN 507 => str := " 507";
            WHEN 508 => str := " 508";
            WHEN 509 => str := " 509";
            WHEN 510 => str := " 510";
            WHEN 511 => str := " 511";
            WHEN 512 => str := " 512";
            WHEN OTHERS => str := "????";
        END CASE;
        RETURN str;
    END FUNCTION to_string;

END PACKAGE BODY utils_package;