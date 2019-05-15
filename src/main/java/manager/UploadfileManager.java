package manager;


import java.io.File;
import java.util.Comparator;

/**
 * Created by FuHua on 2018/5/25.
 */
public class UploadfileManager {
    public static class compratorByLastModified implements Comparator<File> {
        public int compare(File f1, File f2) {
            long diff = f1.lastModified()-f2.lastModified();
            if(diff<0)
                return 1;
            else if(diff==0)
                return 0;
            else
                return -1;
        }
        public boolean equals(Object obj){
            return true;
        }
    }
}
