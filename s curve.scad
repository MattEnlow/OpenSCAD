function angleList(amin,amax,delta) = [for (i=[ceil(amin/delta):floor(amax/delta)]) i*delta];
function reverse(vec) = [for (i=[0:len(vec)-1]) vec[len(vec)-1-i]];

module scurv(r1,r2,d,a,b,w) {
    theta=acos((r1+r2)/d);
    echo(theta);
    polygon(points=concat(
                [for (i=angleList(180-a,450-theta,5))       (r1+w/2)*[cos(i),sin(i)]],
        reverse([for (i=angleList(   -b,270-theta,5)) [0,d]+(r2-w/2)*[cos(i),sin(i)]]),
                [for (i=[5:5:175]) [0,d]+r2*[cos(b),-sin(b)]-(w/2)*[cos(i-a),sin(i-a)]],
                [for (i=angleList(   -b,270-theta,5)) [0,d]+(r2+w/2)*[cos(i),sin(i)]],
        reverse([for (i=angleList(180-a,450-theta,5))       (r1-w/2)*[cos(i),sin(i)]]),
                [for (i=[5:5:175]) r1*[-cos(a),sin(a)]+(w/2)*[cos(i-a),sin(i-a)] ]
    ));
}


translate([-20,0]) scurv(5,3,20,-30,60,1);
                   scurv(4,4,10,  0, 0,2);
translate([ 20,0]) scurv(3,5,13, 30,30,3);
