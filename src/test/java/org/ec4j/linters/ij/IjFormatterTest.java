package org.ec4j.linters.ij;

import org.junit.Assert;
import org.junit.Test;

public class IjFormatterTest {

    @Test
    public void format() {

        final String unformated = "public class C {\n" //
                + "   C ourC = new C(new C());\n" //
                + "}";

        final String expected = "public class C {\n" //
                + "    C ourC = new C(new C());\n" //
                + "}";

        final String actual = null; // TODO: how can I format unformated?

        // Check that this class can see a class from IJ
        com.intellij.psi.impl.source.codeStyle.CodeFormatterFacade codeFormatterFacade = null;
        System.out.println(codeFormatterFacade);

        Assert.assertEquals(expected, actual);
    }

}
