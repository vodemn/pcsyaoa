/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_0189853542;
char *IEEE_P_3972351953;
char *WORK_P_3713469312;
char *WORK_P_0567672752;
char *STD_STANDARD;
char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    std_textio_init();
    work_p_0567672752_init();
    work_p_0189853542_init();
    ieee_p_3972351953_init();
    work_p_3713469312_init();
    work_a_0129275693_3985877809_init();
    work_a_0772165911_3985877809_init();
    work_a_2186872705_3985877809_init();
    work_a_0048428850_3985877809_init();
    work_a_2191791893_0093133731_init();
    work_a_0883720202_1836355321_init();


    xsi_register_tops("work_a_0883720202_1836355321");

    WORK_P_0189853542 = xsi_get_engine_memory("work_p_0189853542");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    WORK_P_3713469312 = xsi_get_engine_memory("work_p_3713469312");
    WORK_P_0567672752 = xsi_get_engine_memory("work_p_0567672752");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
