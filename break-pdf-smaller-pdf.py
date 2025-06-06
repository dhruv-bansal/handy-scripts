from PyPDF2 import PdfReader, PdfWriter

def split_pdf(path, output_folder, max_pages=20):
    reader = PdfReader(path)
    total_pages = len(reader.pages)
    for i in range(0, total_pages, max_pages):
        writer = PdfWriter()
        for j in range(i, min(i + max_pages, total_pages)):
            writer.add_page(reader.pages[j])
        output_path = f"{output_folder}/chunk_{i//max_pages + 1}.pdf"
        with open(output_path, "wb") as f:
            writer.write(f)

def main():
    input_pdf = "/Users/fracon/Downloads/strata-docs/STRATA.pdf"  # Hardcoded input PDF path
    output_folder = "/Users/fracon/Downloads/strata-docs/output"  # Hardcoded output folder
    max_pages = 50  # Hardcoded maximum pages per chunk

    split_pdf(input_pdf, output_folder, max_pages)

if __name__ == "__main__":
    main()