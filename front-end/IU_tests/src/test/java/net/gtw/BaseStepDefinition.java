package net.gtw;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class BaseStepDefinition {

	protected WebDriver dr;
	protected Document document;
	protected PdfWriter writer;
	private String lastPdfText;

	protected void createPDFFile() {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String dtime = dateFormat.format(new Date());
			document = new Document();
			String output = "./evidencias/evidencia_" + dtime + ".pdf";
			FileOutputStream fos = new FileOutputStream(output);
			writer = PdfWriter.getInstance(document, fos);
			writer.open();
			document.open();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	protected void captureScreenshot() {
		try {
			waitForDocumentToSettle();
			byte[] input = ((TakesScreenshot) dr).getScreenshotAs(OutputType.BYTES);
			Image im = Image.getInstance(input);
			im.scaleToFit(PageSize.A4.getWidth() / 2, PageSize.A4.getHeight() / 2);
			document.add(im);
			lastPdfText = null;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	private void waitForDocumentToSettle() {
		if (!(dr instanceof JavascriptExecutor)) {
			return;
		}

		try {
			long deadline = System.currentTimeMillis() + 2500;

			while (System.currentTimeMillis() < deadline) {
				Object readyState = ((JavascriptExecutor) dr).executeScript("return document.readyState");

				if ("complete".equals(readyState)) {
					Thread.sleep(500);
					return;
				}

				Thread.sleep(100);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	protected void addTexto(String texto) {
		try {
			if (texto != null && texto.equals(lastPdfText)) {
				return;
			}

			document.add(new Paragraph(texto));
			lastPdfText = texto;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	protected void closePdf() {
		document.close();
		writer.close();
	}

}
