#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

using namespace cv;

int main() {

	const char* message = "hello opencv";
	printf("%s\n", message);

	// put message to simple image
	Size textsize = getTextSize(message, FONT_HERSHEY_COMPLEX, 3, 5, 0);
	Mat img(textsize.height + 20, textsize.width + 20, CV_32FC1, Scalar(230,230,230));
	putText(img, message, Point(10, img.rows - 10), FONT_HERSHEY_COMPLEX, 3, Scalar(0, 0, 0), 5);

	// show the image
	imshow("opencv", img);
	waitKey();

	return 0;
}

// g++ -std=gnu++11 hello_opencv.cpp `pkg-config --cflags --libs opencv`
