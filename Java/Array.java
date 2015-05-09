public class Array //every class has a name, public is identifier, class is type, Array is file name as well as class name
{

	public static void main(String[] args) 
	{
		int array[] = new int[10]; //initialized an array 'array' for 10 indexes
		
		int i=0; //initialized the int 'i' with a 0, because its needed a value at start to go on further.

		
		while (i<=9)
		{
			array[i] = i;
			System.out.println(array[i]);
			i++;
		}
		
		
		System.out.println("Array has elements " + array[0]+" "+ array[1]+" "+ array[2]+" "+ array[3]+" "+ array[4]+" "+ array[5]+" "+ array[6]+" "+ array[7]+" "+ array[8]+" "+ array[9]);
		System.out.println("Sum upto 10 elements: "+(array[0] + array[1]+ array[2]+ array[3]+ array[4]+ array[5]+ array[6]+ array[7]+ array[8]+ array[9]));
	
	}

}
