function M_out = myInertia(q, parms)

    % https://github.com/cdsousa/SymPyBotics

    %% Denavit-Hartenberg
    a2 = 0.4318;    a3 = 0.0203;
    d3 = 0.15005;   d4 = 0.4318;

    %% Variabili di giunto
    % q1 = q(1);  dq1 = dq(1);   ddq1 = ddq(1);
    % q2 = q(2);  dq2 = dq(2);   ddq2 = ddq(2);
    % q3 = q(3);  dq3 = dq(3);   ddq3 = ddq(3);
    % q4 = q(4);  dq4 = dq(4);   ddq4 = ddq(4);
    % q5 = q(5);  dq5 = dq(5);   ddq5 = ddq(5);
    % q6 = q(6);  dq6 = dq(6);   ddq6 = ddq(6);

    %% parms
    % (L_1xx, L_1xy, L_1xz, L_1yy, L_1yz, L_1zz, l_1x, l_1y, l_1z, m_1, L_2xx, L_2xy, L_2xz, L_2yy, L_2yz, L_2zz, l_2x, l_2y, l_2z, m_2, L_3xx, L_3xy, L_3xz, L_3yy, L_3yz, L_3zz, l_3x, l_3y, l_3z, m_3, L_4xx, L_4xy, L_4xz, L_4yy, L_4yz, L_4zz, l_4x, l_4y, l_4z, m_4, L_5xx, L_5xy, L_5xz, L_5yy, L_5yz, L_5zz, l_5x, l_5y, l_5z, m_5, L_6xx, L_6xy, L_6xz, L_6yy, L_6yz, L_6zz, l_6x, l_6y, l_6z, m_6)
    % Where:
    %   L is the link inertia tensor computed about the link frame;
    %   l is the link first moment of inertia;
    %   m is the link mass.
    % These are the so-called barycentric parameters, with respect to which the dynamic model is linear.


    x0 = sin(q(2));
    x1 = cos(q(2));
    x2 = -a2;
    x3 = x1*(((x0)*(x0))*x2 + ((x1)*(x1))*x2);
    x4 = cos(q(3));
    x5 = x0*x4;
    x6 = sin(q(3));
    x7 = x1*x6;
    x8 = x5 + x7;
    x9 = x1*x4;
    x10 = -x6;
    x11 = x0*x10;
    x12 = x11 + x9;
    x13 = -d3;
    x14 = x13*x5 + x13*x7;
    x15 = cos(q(4));
    x16 = x15*x8;
    x17 = sin(q(4));
    x18 = x17*x8;
    x19 = d3*x11 + d3*x9;
    x20 = -x3;
    x21 = a3*((x4)*(x4)) + a3*((x6)*(x6));
    x22 = x11*x21 + x20 + x21*x9;
    x23 = -x22;
    x24 = d4*x16 + x15*x23 + x17*x19;
    x25 = sin(q(5));
    x26 = cos(q(5));
    x27 = x12*x25 + x16*x26;
    x28 = -x18;
    x29 = -x25;
    x30 = x12*x26 + x16*x29;
    x31 = d4*x28 + x15*x19 + x17*x22;
    x32 = x14*x26 + x29*x31;
    x33 = cos(q(6));
    x34 = sin(q(6));
    x35 = x27*x33 + x28*x34;
    x36 = -x34;
    x37 = x27*x36 + x28*x33;
    x38 = -parms(59);
    x39 = -x24;
    x40 = x14*x25 + x26*x31;
    x41 = x33*x39 + x36*x40;
    x42 = parms(51)*x35 + parms(52)*x37 + parms(53)*x30 + parms(58)*x32 + x38*x41;
    x43 = -parms(49);
    x44 = x33*x40 + x34*x39;
    x45 = -parms(57);
    x46 = parms(52)*x35 + parms(54)*x37 + parms(55)*x30 + parms(59)*x44 + x32*x45;
    x47 = parms(41)*x27 + parms(42)*x28 + parms(43)*x30 + parms(48)*x32 + x33*x42 + x36*x46 + x39*x43;
    x48 = -parms(39);
    x49 = -parms(48);
    x50 = -parms(58);
    x51 = parms(53)*x35 + parms(55)*x37 + parms(56)*x30 + parms(57)*x41 + x44*x50;
    x52 = parms(43)*x27 + parms(45)*x28 + parms(46)*x30 + parms(47)*x39 + x40*x49 + x51;
    x53 = parms(31)*x16 + parms(32)*x12 + parms(33)*x18 + parms(38)*x24 + x14*x48 + x26*x47 + x29*x52;
    x54 = -parms(47);
    x55 = -parms(42)*x27 - parms(44)*x28 - parms(45)*x30 - parms(49)*x40 - x32*x54 - x33*x46 - x34*x42;
    x56 = -parms(38);
    x57 = parms(33)*x16 + parms(35)*x12 + parms(36)*x18 + parms(37)*x14 + x31*x56 + x55;
    x58 = parms(57)*x30 + parms(60)*x41 + x35*x38;
    x59 = parms(59)*x37 + parms(60)*x44 + x30*x50;
    x60 = -x12;
    x61 = parms(37)*x60 + parms(38)*x16 + parms(40)*x24 - parms(47)*x30 - parms(50)*x39 - x27*x43 - x33*x58 - x34*x59;
    x62 = d4*x15;
    x63 = parms(49)*x28 + parms(50)*x40 + x30*x49 + x33*x59 + x36*x58;
    x64 = parms(48)*x27 + parms(50)*x32 + parms(58)*x35 + parms(60)*x32 + x28*x54 + x37*x45;
    x65 = parms(38)*x28 + parms(39)*x12 + parms(40)*x31 + x26*x63 + x29*x64;
    x66 = d4*x17;
    x67 = parms(21)*x8 + parms(23)*x12 + parms(28)*x14 + parms(29)*x23 + x15*x53 + x17*x57 + x61*x62 - x65*x66;
    x68 = parms(32)*x16 + parms(34)*x12 + parms(35)*x18 + parms(37)*x39 + parms(39)*x31 + x25*x47 + x26*x52;
    x69 = parms(23)*x8 + parms(26)*x12 + parms(27)*x22 - parms(28)*x19 + x68;
    x70 = parms(28)*x60 + parms(30)*x19 + x15*x65 + x17*x61;
    x71 = x13*x6;
    x72 = parms(28)*x8 + parms(30)*x14 + parms(37)*x18 + parms(40)*x14 + x16*x48 + x25*x63 + x26*x64;
    x73 = x4*x72;
    x74 = -parms(29);
    x75 = -x15;
    x76 = parms(27)*x12 + parms(30)*x22 + x17*x65 + x61*x75 + x74*x8;
    x77 = x21*x76;
    x78 = -parms(27);
    x79 = -parms(22)*x8 - parms(25)*x12 - parms(29)*x19 - x14*x78 - x17*x53 - x57*x75 - x61*x66 - x62*x65;
    x80 = a2*(-parms(19)*x0 + x6*x70 + x73) + parms(13)*x0 + parms(15)*x1 + x21*x72 + x79;
    x81 = a3*x72 + x79;
    x82 = -parms(24);
    x83 = a2*x6;
    x84 = -x66;
    x85 = x17*x83 + x84;
    x86 = a2*x4 + x21;
    x87 = -x62;
    x88 = x15*x83 + x87;
    x89 = x26*x86 + x29*x88;
    x90 = -x85;
    x91 = x25*x86 + x26*x88;
    x92 = x33*x90 + x36*x91;
    x93 = -x17;
    x94 = x26*x93;
    x95 = x33*x94 + x34*x75;
    x96 = x33*x75 + x36*x94;
    x97 = x29*x93;
    x98 = parms(51)*x95 + parms(52)*x96 + parms(53)*x97;
    x99 = parms(58)*x89 + x38*x92 + x98;
    x100 = x33*x91 + x34*x90;
    x101 = parms(52)*x95 + parms(54)*x96 + parms(55)*x97;
    x102 = parms(59)*x100 + x101 + x45*x89;
    x103 = parms(41)*x94 + parms(42)*x75 + parms(43)*x97;
    x104 = parms(48)*x89 + x102*x36 + x103 + x33*x99 + x43*x90;
    x105 = parms(53)*x95 + parms(55)*x96 + parms(56)*x97;
    x106 = parms(57)*x92 + x100*x50 + x105;
    x107 = parms(43)*x94 + parms(45)*x75 + parms(46)*x97;
    x108 = parms(47)*x90 + x106 + x107 + x49*x91;
    x109 = parms(31)*x93 + parms(33)*x15;
    x110 = parms(42)*x94 + parms(44)*x75 + parms(45)*x97;
    x111 = -parms(49)*x91 - x102*x33 - x110 - x34*x99 - x54*x89;
    x112 = parms(33)*x93 + parms(36)*x15;
    x113 = parms(59)*x96 + x50*x97;
    x114 = parms(60)*x100 + x113;
    x115 = parms(57)*x97 + x38*x95;
    x116 = parms(60)*x92 + x115;
    x117 = parms(49)*x75 + x49*x97;
    x118 = parms(50)*x91 + x114*x33 + x116*x36 + x117;
    x119 = parms(38)*x75;
    x120 = parms(58)*x95 + x45*x96;
    x121 = parms(48)*x94 + x54*x75;
    x122 = parms(50)*x89 + parms(60)*x89 + x120 + x121;
    x123 = parms(40)*x88 + x118*x26 + x119 + x122*x29;
    x124 = parms(47)*x97 + x43*x94;
    x125 = parms(38)*x93;
    x126 = parms(40)*x85 - parms(50)*x90 - x114*x34 - x116*x33 - x124 + x125;
    x127 = -parms(29)*x83 - x123*x62 - x126*x66 - x17*(parms(38)*x85 + x104*x26 + x108*x29 + x109 + x48*x86) - x75*(parms(37)*x86 + x111 + x112 + x56*x88) - x78*x86 - x82;
    x128 = parms(37)*x15 + x48*x93;
    x129 = parms(27) + parms(30)*x86 + parms(40)*x86 + x118*x25 + x122*x26 + x128;
    x130 = a3*x129 + x127;
    x131 = parms(32)*x93 + parms(35)*x15;
    x132 = parms(37)*x90 + parms(39)*x88 + x104*x25 + x108*x26 + x131;
    x133 = a3*x26 + x29*x87;
    x134 = -x84;
    x135 = a3*x25 + x26*x87;
    x136 = x134*x33 + x135*x36;
    x137 = parms(58)*x133 + x136*x38 + x98;
    x138 = x134*x34 + x135*x33;
    x139 = parms(59)*x138 + x101 + x133*x45;
    x140 = parms(48)*x133 + x103 + x134*x43 + x137*x33 + x139*x36;
    x141 = parms(57)*x136 + x105 + x138*x50;
    x142 = parms(47)*x134 + x107 + x135*x49 + x141;
    x143 = -parms(49)*x135 - x110 - x133*x54 - x137*x34 - x139*x33;
    x144 = parms(60)*x138 + x113;
    x145 = parms(60)*x136 + x115;
    x146 = parms(50)*x135 + x117 + x144*x33 + x145*x36;
    x147 = parms(50)*x133 + parms(60)*x133 + x120 + x121;
    x148 = parms(37)*x134 + parms(39)*x87 + x131 + x140*x25 + x142*x26;
    x149 = x25*x33;
    x150 = x29*x34;
    x151 = parms(51)*x149 + parms(52)*x150 + parms(53)*x26;
    x152 = parms(52)*x149 + parms(54)*x150 + parms(55)*x26;
    x153 = parms(53)*x149 + parms(55)*x150 + parms(56)*x26;
    x154 = -parms(42)*x25 - parms(45)*x26 - x151*x34 - x152*x33;
    x155 = -x33;
    x156 = parms(53)*x36 + parms(55)*x155;

    M(1) = parms(4) + x0*(parms(11)*x0 + parms(12)*x1 + parms(18)*x3 + x10*x69 + x10*x77 + x13*x73 + x4*x67 + x70*x71) + x1*(d3*x4*x70 + parms(12)*x0 + parms(14)*x1 + parms(17)*x20 + x4*x69 + x4*x77 + x6*x67 + x71*x72) + x3*(-parms(17)*x1 + parms(18)*x0 + parms(20)*x3 - x76);
    M(2) = x80;
    M(3) = x81;
    M(4) = x68;
    M(5) = x55;
    M(6) = x51;
    M(7) = x80;
    M(8) = a2*parms(17) + a2*(a2*parms(20) + parms(17) + x129*x4 + x6*(parms(30)*x83 + x123*x15 + x126*x17 + x74)) + parms(16) + x127 + x129*x21;
    M(9) = x130;
    M(10) = x132;
    M(11) = x111;
    M(12) = x106;
    M(13) = x81;
    M(14) = x130;
    M(15) = -a3*x78 + a3*(a3*parms(30) + a3*parms(40) + parms(27) + x128 + x146*x25 + x147*x26) - x17*(a3*x48 + parms(38)*x84 + x109 + x140*x26 + x142*x29) - x62*(parms(40)*x87 + x119 + x146*x26 + x147*x29) - x66*(parms(40)*x84 - parms(50)*x134 - x124 + x125 - x144*x34 - x145*x33) - x75*(a3*parms(37) + x112 + x143 + x56*x87) - x82;
    M(16) = x148;
    M(17) = x143;
    M(18) = x141;
    M(19) = x68;
    M(20) = x132;
    M(21) = x148;
    M(22) = parms(34) + x25*(parms(41)*x25 + parms(43)*x26 + x151*x33 + x152*x36) + x26*(parms(43)*x25 + parms(46)*x26 + x153);
    M(23) = x154;
    M(24) = x153;
    M(25) = x55;
    M(26) = x111;
    M(27) = x143;
    M(28) = x154;
    M(29) = parms(44) - x33*(parms(52)*x36 + parms(54)*x155) - x34*(parms(51)*x36 + parms(52)*x155);
    M(30) = x156;
    M(31) = x51;
    M(32) = x106;
    M(33) = x141;
    M(34) = x153;
    M(35) = x156;
    M(36) = parms(56);


    M_out = reshape(M,6,6)';

end
