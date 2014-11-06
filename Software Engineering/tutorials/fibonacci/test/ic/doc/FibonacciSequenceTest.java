package ic.doc;

import org.junit.Test;

import java.util.Iterator;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

public class FibonacciSequenceTest {

    Sequence fibonacci = new Sequence(new FibonacciSequence());

    @Test
    public void definesTheFirstTwoTermsToBeOne() {
        assertEquals(1, fibonacci.term(0));
        assertEquals(1, fibonacci.term(1));
    }

    @Test
    public void hasEachTermEqualToTheSumOfThePreviousTwo() {
        assertEquals(2, fibonacci.term(2));
        assertEquals(3, fibonacci.term(3));
        assertEquals(5, fibonacci.term(4));
        assertEquals(8, fibonacci.term(5));
    }

    @Test
    public void isNotDefinedForNegativeTerms() {
        try {
            fibonacci.term(-1);
            fail("Expected exception");
        } catch (IllegalArgumentException iae) {
            assertEquals("Not defined for negative terms", iae.getMessage());
        }
    }

    @Test
    public void canBeIteratedThrough() {

        Iterable<Integer> sequence = fibonacci;

        Iterator<Integer> i = sequence.iterator();
        assertTrue(i.hasNext());
        assertThat(i.next(), is(1));
        assertThat(i.next(), is(1));
        assertThat(i.next(), is(2));
        assertThat(i.next(), is(3));
        assertTrue(i.hasNext());
    }

    @Test
    public void canHaveMultipleIndependentIterators() {

        Iterator<Integer> i1 = fibonacci.iterator();
        Iterator<Integer> i2 = fibonacci.iterator();

        assertThat(i1.next(), is(1));
        assertThat(i1.next(), is(1));

        assertThat(i2.next(), is(1));
        assertThat(i2.next(), is(1));
        assertThat(i2.next(), is(2));
        assertThat(i2.next(), is(3));

        assertThat(i1.next(), is(2));
        assertThat(i1.next(), is(3));
    }

}
