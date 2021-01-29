package observation;

import com.test.observation.*;

public class Main {

	public static void addObserver(Observable foo) {
		Observer bar = new Observer() {
			@Override
			public void update() {
				System.out.println("Java observer");
			}
		};
		foo.setObserver(bar);
	}

	public static void main(String[] args) {
		System.loadLibrary("swigDirectorTestSWIG");

		Observable foo = new Observable();

		foo.change();

		System.out.println("Observable Director Test");
	}
}
