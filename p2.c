#define _USE_MATH_DEFINES
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

const int altCeil = 40000;
const int altFloor = 10000;
const int altStep = 1000;



double p1_get_T_R(double h_ft, double Re_ft, double h_trop_ft, double h_max_ft, double T0_R, double L_R_per_ft, double T_iso_R){
    double T_R = 0.0;
    double Z = (Re_ft*h_ft) / (Re_ft+h_ft);

    if(!(h_ft < 0) && !(h_ft > h_max_ft)){

        if ((h_ft >= 0) && (h_ft <= h_trop_ft)){

            T_R = T0_R - (L_R_per_ft * Z);
            return T_R;

        }else if ((h_ft >= 0) && (h_ft <= h_max_ft)){

            T_R = T_iso_R;
            return T_R;

        }

    }else{

        T_R = -1;
        return T_R;

    }
}

double p1_get_sos(double T_R , double gamma , double R_air ){

    double a = a = sqrt(gamma*R_air*T_R);
    return a;

}

double p1_get_mach(double V_kts, double T_R, double gamma, double R_air, double kts_to_fts){

    double a = p1_get_sos(T_R , gamma , R_air );
    double M = 0.0;

    if (V_kts < 0){
        M = -1;
        return M;
    }else {
        M = (V_kts * kts_to_fts) / (a);
        return M;
    }

}

double p1_get_tsfc(double M , double theta){

    double tsfc = (0.4 + (0.45*M))*sqrt(theta);
    return tsfc;

}

double p1_get_max_LOD(double AR , double e , double CD0){

    double LODmax = (0.5) * sqrt( (M_PI * AR * e) / (CD0) );
    return LODmax;

}

double p1_get_range(double V_kts , double tsfc , double LDmax , double Wto_lb , double Wfuel_lb){

    double Wf = Wto_lb - Wfuel_lb;

    double Rnmi = (V_kts / tsfc) * (LDmax) * log(Wto_lb/Wf);

    return Rnmi;
}

void generateAltitudes(double *altitudes , int size_of_array){

    for(int i = 0 ; i < size_of_array ; i++){
        altitudes[i] = altFloor + (altStep * i);
    }
}

int main(){
    int size_of_array = ((altCeil - altFloor) / (altStep)) + 1; //create array with variables declared uptop

    double *altitudes = (double *) calloc(size_of_array , sizeof(double)); //dynamically allocate memory depending on array size

    if(altitudes == NULL){
        printf("Error Allocating Memory.");
        exit(0);
    }

    generateAltitudes(altitudes , size_of_array);


    /* --------- Instructor-specified L-1011 aircraft inputs --------- */
    double Wto_lb   = (124*3456);     // aircraft total weight (lb)
    double Wfuel_lb = 0.352*Wto_lb; // aircraft fuel weight (lb)
    double V_kts    = 482;          // aircraft airspeed (knots)

    double AR  = 6.95;    // wing aspect ratio
    double e   = 0.606;   // wing Oswald efficiency factor
    double CD0 = 0.01809; // aircraft zero-lift drag coefficient

    /* --------- Atmosphere/constants --------------------------------*/
    double Re_ft      = 20925524.9;   // Earth radius (ft)
    double T0_R       = 518.67;       // sea-level temperature (Rankine)
    double h_trop_ft  = 36089.239;    // tropopause altitude (ft)
    double h_max_ft   = 65616.798;    // max altitude for model (ft)
    double T_iso_R    = 389.97;       // isothermal temperature (Rankine)
    double L_R_per_ft = 0.00356616;   // lapse-rate coefficient (deg R / ft of geopotential altitude)

    double gamma      = 1.4;          // specific heat ratio of air
    double R_air      = 1716.46;      // air gas constant ft*lbf/(slug*R)

    double kts_to_fts = 1.68781;      // conversion of knots to ft/sec

    /* --------- Altitude sweep: 10,000 to 40,000 ft ---------
    % TODO create altitude array from 10000 to 40000 ft in 1000 ft
    % incremements. Check your array in the command window
    */

    double best_alt_ft = -1.0;
    double best_range_nmi = -1.0;


    for(int i = 0; i < size_of_array; i++){
        double h_ft = altitudes[i];
        double T_R = p1_get_T_R(h_ft,Re_ft,h_trop_ft,h_max_ft,T0_R,L_R_per_ft,T_iso_R);
        double theta = T_R / T0_R;
        double M = p1_get_mach(V_kts,T_R,gamma,R_air,kts_to_fts);
        double tsfc = p1_get_tsfc(M , theta);
        double LODmax = p1_get_max_LOD(AR , e , CD0);
        double Rnmi = p1_get_range(V_kts , tsfc , LODmax , Wto_lb , Wfuel_lb);

        if (Rnmi > best_range_nmi){
            best_range_nmi = Rnmi;
            best_alt_ft = altitudes[i];
        }
    }

    printf("%lf" , best_alt_ft);

    free(altitudes);
    return 0;
}