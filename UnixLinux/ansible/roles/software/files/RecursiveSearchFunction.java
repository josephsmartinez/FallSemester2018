/**
 *
 * @author Joseph
 */
public class RecursiveSearchFunction {
    /**
     * The Tri-Search will return the a number found within a list.
     * The Complexity time for this function if O(log n), when log has a base of 3.
     * @param list  List of number(s)
     * @param l     Left side
     * @param r     Right side
     * @param x     Number to search for
     * @return      Return number's index if found, else return -1
     */
    public static int triSearch(int[] list, int l, int r, int x){
        //If the list is less than or equal to one
        if(r >= 0){
            int mid1 = l + (r - l)/3;
            int mid2 = mid1 + (r - l)/3;

            // If x is present at the mid1
            if (list[mid1] == x){  
                return mid1;
            }else{
                // Else x is present at the mid2
                if (list[mid2] == x)  return mid2;
            }
            // If x is present in left one-third
            if (list[mid1] > x) return triSearch(list, l, mid1-1, x);

            // If x is present in right one-third
            if (list[mid2] < x) return triSearch(list, mid2+1, r, x);

            // If x is present in middle one-third
            return triSearch(list, mid1+1, mid2-1, x);
        }
        return -1;
    }
    
    /**
     * Method will call the tri-nary search 
     * @param x is the number to search for
     * @param list is the list of numbers
     */
    public static void search(int x, int[] list){
        int l = 0;
        int r = list.length -1;
        int found =  triSearch(list, l, r, x);
        for (int i : list) {
            System.out.print(i + " ");
        }
        System.out.println("\nLooking for: " + x);
        String results = (found < 0) ? results = "not found" : Integer.toString(found);
        System.out.println("Found number at index: " + results + "\n");
    }
    /**
     * The main method will make four testing cases that will print the results
     * of searching for the number within a list.
     * @param args 
     */
    public static void main(String[] args) {
        //UNIT TESTING / TEST CASES
        int[] list = {1, 2, 3, 4, 5, 6, 7,8, 9, 10};
        int[] list2 = {1};
        //Test 1
        search(5, list);
        //Test 2
        search(0, list);
        //Test 3
        search(-10, list);
        //Test 4
        search(1, list);
        //Test 5
        search(1, list2);
    }
}
